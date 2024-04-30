!$Id:$
      subroutine influid(d,tdof,ndv,eltype)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2024: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!     Modification log                                Date (dd/mm/year)
!       Original version                                    02/04/2018
!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Input material parameters for material models

!      Inputs:
!         ietype    - Element type indicator
!                     1: Fluid
!                     2: Boundary
!                     3: FSI
!                     4: Streamlines

!      Outputs:
!         d(*)      - Material set parameters
!         tdof      - Dof to specify temperature location in
!                     coupled thermo-mechanical problems
!         ndv       - Number of element history variables

!      Geometry types
!         stype     - Geometry identifier
!                     1: 3-D
!                     2: Plane strain
!                     3: Axisymmetric without orsion
!                     8: Axisymmetric with torsion
!                     9: Spherical symmetry
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'cdata.h'
      include  'cdat1.h'
      include  'chdata.h'
      include  'eldata.h'
      include  'elplot.h'
      include  'hdata.h'
      include  'iofile.h'
      include  'nblend.h'
      include  'pconstant.h'
      include  'pglob1.h'
      include  'pmod2d.h'
      include  'qudshp.h'
      include  'refnd.h'
      include  'refng.h'
      include  'sdata.h'
      include  'setups.h'
      include  'strnum.h'
      include  'umac1.h'

      include  'pointer.h'
      include  'comblk.h'

      character (len=21) :: qd(5)
      character (len=15) :: text(2)
      character (len=13) :: wd(10)
      character (len=11) :: gwd(4)

      logical       :: pcomp,erflag,errck,tinput
      logical       :: cflag,eflag,fflag,iflag,sflag,tflag,uflag
      logical       :: uparfl,qdflg,qdinp, inputs,incomp
      logical       :: damgfl,ietype1,efl,flg,oned

      integer       :: eltype,ietype,imat,ndv,nvis,tdof,i,ii,j,jj
      integer       :: n1,n3,nlob,nseg,nqud,ntm,naug,ti
      integer       :: tmat,ndel, umat,uprm

      real (kind=8) :: d(*)
      real (kind=8) :: mu1,nu12,t1
      real (kind=8) :: ev(10),alp(3)

      save

      data      wd   /'3-Dimensional' ,'Plane Strain' ,'Axisymmetric',
     &                'Plate & Shell','Truss & Frame','Thermal',
     &                '3-Dimensional','Axisy+Torsion','Spherical',
     &                'Membrane' /

      data      qd   /'G a u s s' ,'N o d a l' ,'T r i a n g l e',
     &                'T e t r a h e d r o n' ,'L o b a t t o'/

      data      gwd  /'Cartesian','Cylindrical','Spherical','Local'/

!     PART 1: Set default values from 'global' parameters
      tdof     = gtdof                  ! Temperature DOF
      etype    = 1                      ! Displacement (QnPm)
      dtype    = gdtype                 ! Navier-Stokes/ALE
      ietype   = abs(eltype)            ! Element type
      ietype1  = ietype.eq.1

      mu1       = 0.0d0                  ! Default basic viscosity

!     Set flag for N-S (sflag) or ALE (fflag)
      if(dtype.gt.0 .or. ietype.ne.1) then
        fflag  = .false.
        sflag  = .true.
      else
        fflag  = .true.
        sflag  = .false.
      endif

!     Set default flags
      cflag  = .false.
      eflag  = .false.
      erflag = .false.
      hflag  = .false.
      iflag  = .false.
      incomp = .false.
      oned   = .false.
      plasfl = .false.
      qdflg  = .true.
      qdinp  = .false.
      tflag  = .false.
      uflag  = .false.
      damgfl = .false.
      viscfl = .false.
      uparfl = .false.

!     Set default quadrature order
      if(nen.gt.11.and. ndm.eq.2) then
        ii = 4
      elseif(nen.gt.4 .and. ndm.eq.2 .or.
     &   nen.gt.8 .and. ndm.eq.3 ) then
        ii = 3
      else
        ii = 2
      endif
      jj = ii   ! Default stress outputs (at quadrature of residual)

!     Default parameters
      imat = 0
      tmat = 0
      lref = 0
      naug = 0
      ndel = 0
      nvis = 0
      nqud = 0
      nseg = 0
      nlob = 2

!     Default Mass: Consistent
      d( 7) = 1.d0

!     Set element type
      d(170) = 1.d0  ! Default volume model

!     Fluid model type
      if(ietype.eq.1) then
        stype  = g2type

      elseif(ietype.eq.1) then
        stype = 1
      endif

!     Quadrature type
      d(14)  = 1.d0                           ! Element thickness
      alp(1) = 0.d0

!     PART 2: Poll for legal input records: Stop on blank record

      inputs = .true.
      do while(inputs)

!       Input record
        errck = .true.
        do while(errck)
          errck = tinput(text(1),2,ev,10)
        end do ! while

!       Check end of data
        if(pcomp(text(1),'    ',4)) then

!         Transfer to sets and checks
          inputs = .false.

!       Reset element type
        elseif(pcomp(text(1),'flui',4)) then
          ietype = 1
        elseif(pcomp(text(1),'boun',4)) then
          ietype = 2
        elseif(pcomp(text(1),'fsi',3)) then
          ietype = 3

!       Mass density
        elseif(pcomp(text(1),'dens',4)) then
          d(4)  = ev(1)
          if(ev(2).eq.0.0d0) then
            d(8) = 1.d0
          else
            d(8) = max(0.0d0,ev(2))
          endif

!       Mass matrix type
        elseif(pcomp(text(1),'mass',4)) then
          if(pcomp(text(2),'lump',4) .or.
     &       pcomp(text(2),'diag',4)) then
            d(  7) =  0.0d0
            d(183) =  ev(2) ! Scaling factor
          elseif(pcomp(text(2),'cons',4)) then
            d(  7) =  1.0d0
            d(183) =  ev(2)
          elseif(pcomp(text(2),'off',3)) then
            d(  7) = -1.0d0
            d(183) =  0.0d0
          else
            d(  7) =  ev(1)
            d(183) =  ev(2)
          endif

!       Hierarchical flag

        elseif(pcomp(text(1),'hier',4)) then

          if(pcomp(text(2),'off',3)) then
            d(120) = 0.0d0   ! Set formulation to normal
          else
            d(120) = 1.0d0   ! Set formulation to hierarchical
          endif

!       Fluid material body forces

        elseif(pcomp(text(1),'body',4)) then

          d(11) = ev(1)
          d(12) = ev(2)
          d(13) = ev(3)
          if(pcomp(text(2),'loca',4)) then
            d(69) = 2.0d0
          elseif(pcomp(text(2),'gfol',4)) then
            d(69) = 3.0d0
          elseif(pcomp(text(2),'lfol',4)) then
            d(69) = 4.0d0
          else
            d(69) = 1.0d0
          endif

!       Plot projection controls

        elseif(pcomp(text(1),'plot',4)) then

          if(pcomp(text(2),'off',3)) then
            d(171) = 1.0d0
          else
            d(171) = 0.0d0
          endif

!       Kinematics type: Navier-Stokes (no ALE)
        elseif(pcomp(text(1),'smal',4)) then

          dtype = 1
          if(ietype.lt.6) then
            sflag = .true.
            fflag = .false.
          endif

!       Kinematics type: ALE (mesh deforms)
        elseif(pcomp(text(1),'ale',3)) then

          dtype = -1
          fflag = .true.
          sflag = .false.
          if(pcomp(text(2),'volu',4)) then
            d(170) = max(1,min(4,nint(ev(1))))
          endif

!       Element type:
        elseif(pcomp(text(1),'type',4)) then

!         Velocity with element pressure u-p QnQn
          if(pcomp(text(2),'velo',4)) then
            etype = 1
            incomp = .true.
            d(170) = 5.0d0  ! Incompressible model
!         Stabilized: Dohrmann & Bochev: u-p QnQn
          elseif(pcomp(text(2),'boch',4)) then
            etype = 2
!           Force incompressible solutions
            incomp = .true.
            d(170) = 5.0d0  ! Incompressible model
!         Element type: u-p Taylor-Hood
          elseif(pcomp(text(2),'hood',4)) then
            etype = 3
!           Force incompressible solutions
            incomp = .true.
            d(170) = 5.0d0  ! Incompressible model
!         Element type: u-p Donea: QnPm (split)
          elseif(pcomp(text(2),'done',4)) then
            etype = 4
!           Force incompressible solutions
            incomp = .true.
            d(170) = 5.0d0  ! Incompressible model

!         Element type: u-p Chorin: QnQm (split)
          elseif(pcomp(text(2),'chor',4)) then
            etype = 5
!           Force incompressible solutions
            incomp = .true.
            d(170) = 5.0d0  ! Incompressible model

!         Element type: u-p Taylor-Galerkin/CBS: QnQn (split)
          elseif(pcomp(text(2),'cbs',3).or.pcomp(text(2),'t-g',3)) then
            etype = 6
!           Force incompressible solutions
            incomp = .true.
            d(170) = 5.0d0  ! Incompressible model

!         Element type: Arbitrary Lagrangian-Eulerian (ALE)
          elseif(pcomp(text(2),'ale',3)) then
            etype = 9

!         Element type: Streamline function
          elseif(pcomp(text(2),'stre',4)) then

            if(ndm.eq.2) then
              d(31) = 1.0d0
              if(ev(1).le.0.0d0) then
                d(34) = ndf
              else
                d(34) = ev(1)
              endif
            else
              write(  *,'(a)')'INFLUID: ERROR Streamline in 2-d only'
              call plstop(.true.)
            endif

          endif

!       Interpolation type: NURBS <option>

        elseif(pcomp(text(1),'nurb',4)) then

          nurma = nurma + 1

          if(    pcomp(text(2),'hspl',4) .or.
     &           pcomp(text(2),'h-sp',4)) then
            d(189) = 7.0d0
          elseif(pcomp(text(2),'mixe',4)) then
            d(189) = 6.0d0
          elseif(pcomp(text(2),'bezi',4)) then
            d(189) = 5.0d0
          elseif(pcomp(text(2),'tspl',4) .or.
     &           pcomp(text(2),'t-sp',4)) then
            d(189) = 4.0d0
          elseif(pcomp(text(2),'bspl',4)) then
            d(189) = 3.0d0
          elseif(pcomp(text(2),'loca',4)) then
            d(189) = 2.0d0
          else
            d(189) = 1.0d0
          endif

!         Set quadrature values for NURBS patches
          do i = 1,3
            if(ev(i).gt.0.0d0) then
              d(189+i) = ev(i)
            elseif(ev(i).lt.0.0d0) then
              d(189+i) = 0.0d0
            else
              d(189+i) = 5.d0
            endif
          end do ! i

!       Interpolation type: B-Spline
        elseif(pcomp(text(1),'bspl',4)) then

          d(189) = 3.0d0
          do i = 1,3
            if(ev(i).gt.0.0d0) then
              d(189+i) = ev(i)
            else
              d(189+i) = 5.d0
            endif
          end do ! i

!       Interpolation type: T-Spline
        elseif(pcomp(text(1),'tspl',4)  .or.
     &         pcomp(text(1),'t-sp',4)) then

          d(189) = 4.0d0
          do i = 1,3
            if(ev(i).gt.0.0d0) then
              d(189+i) = ev(i)
            elseif(ev(i).lt.0.0d0) then
              d(189+i) = 0.0d0
            else
              d(189+i) = 5.d0
            endif
          end do ! i

!       Interpolation type: BEZIer

        elseif(pcomp(text(1),'bezi',4)) then

          d(189) = -5.0d0
          do i = 1,3
            if(ev(i).gt.0.0d0) then
              d(189+i) = ev(i)
            else
              d(189+i) = 5.d0
            endif
          end do ! i

!       Interpolation type: H-Spline

        elseif(pcomp(text(1),'hspl',4)  .or.
     &         pcomp(text(1),'h-sp',4)) then

          d(189) = 7.0d0
          do i = 1,3
            if(ev(i).gt.0.0d0) then
              d(189+i) = ev(i)
            elseif(ev(i).lt.0.0d0) then
              d(189+i) = 0.0d0
            else
              d(189+i) = 5.d0
            endif
          end do ! i

!       Interpolation type: VEM

        elseif(pcomp(text(1),'vem',3)) then

          d(189) = 8.0d0
          nh1    = nh1 + 1

!       Interpolation type: BERNstein

        elseif(pcomp(text(1),'bern',4)) then

          d(189) = 9.0d0

!       Interpolation type: HIERarchical

        elseif(pcomp(text(1),'hier',4)) then

          d(189) = 10.0d0

!       Interpolation type: INTErpolate <option>

        elseif(pcomp(text(1),'inte',4)) then

          if(    pcomp(text(2),'lagr',4)) then  ! Lagrange interp.
            d(189) = 0.0d0
          elseif(pcomp(text(2),'bern',4)) then  ! Bernstein interp.
            d(189) = 9.0d0
          elseif(pcomp(text(2),'hier',4)) then  ! Hierarchic interp.
            d(189) = 10.0d0
          endif

!       Initial data
        elseif(pcomp(text(1),'init',4)) then

!         Constant initial stress/strain state
          if( pcomp(text(2),'stre',4)) then
            d(160)     = 1
            d(161:166) = ev(1:6)
          elseif( pcomp(text(2),'stra',4)) then
            d(160)     = 3
            d(161:166) = ev(1:6)
          elseif( pcomp(text(2),'augm',4)) then
            d(160)     = 2
          endif

!       Quadrature data
        elseif(pcomp(text(1),'quad',4)) then

!         Set nodal quadrature flag
          qdinp = .true.
          qdflg = .true.
          if(pcomp(text(2),'noda',4) .or. pcomp(text(2),'node',4)) then
            d(182) = 2.0d0
            ti     = 2
          elseif(pcomp(text(2),'tria',4)) then ! Triangular
            qdflg  = .false.
            d(182) = 3.0d0
            ti     = 3
          elseif(pcomp(text(2),'tetr',4)) then ! Tetrahedral
            qdflg  = .false.
            d(182) = 4.0d0
            ti     = 4
          elseif(pcomp(text(2),'loba',4)) then ! Lobatto
            d(182) = 5.0d0
            ti     = 5
          else                                 ! Gauss
            d(182) = 0.0d0
            ti     = 1
          endif

!         Limit quadrature for built-in elements
          if(ev(1).ne.0.0d0 .or. ev(2).ne.0.0d0) then
            if(eltype.gt.0 .and. qdflg) then
              ii = max(-1,min(5,nint(ev(1))))
              jj = max( 1,min(5,nint(ev(2))))
            else
              ii = nint(ev(1))
              jj = nint(ev(2))
            endif
          endif

!       Temperature dof
        elseif(ietype.ne.6 .and.
     &     (pcomp(text(1),'temp',4) .or. pcomp(text(1),'volt',4))) then

          tdof = nint(ev(1))

!       Input solution type: 3-d, axisym
        elseif(pcomp(text(1),'plan',4)) then
            stype = 2

        elseif(pcomp(text(1),'axis',4)) then
          if( pcomp(text(2),'tors',4)) then
            stype = 8
          else
            stype = 3
          endif

        elseif(pcomp(text(1),'sphe',4)) then
          stype = 9

!       Penalty parameter
        elseif(pcomp(text(1),'pena',4)) then
          d(60)  = ev(1)

!       Augmentation switch
        elseif(pcomp(text(1),'augm',4)) then
          if(pcomp(text(2),'off',3)) then
            d(185) = 0.0d0
          else
            d(185) = 1.0d0
          endif

          if(pcomp(text(2),'expl',4)) then
            d(186) = 1.0d0
          else
            d(186) = 0.0d0
          endif

!       Incompressible flag
        elseif(pcomp(text(1),'inco',4)) then

          if(pcomp(text(2),'off',3)) then
            incomp = .false.
          else
            incomp = .true.
            d(170) = 5.0d0   ! Incompressible volume model = 5
          endif

!       Input error estimator value
        elseif(pcomp(text(1),'adap',4)) then

          if(pcomp(text(2),'erro',4)) then
            if(ev(1).eq.0.0d0) then
              d(50) = 0.05
            else
              d(50) = ev(1)
            endif
          endif

!       Newtonian fluid properties
        elseif(pcomp(text(1),'newt',4)) then
          imat  = 1
          eflag = .true.
          d(22) = ev(1)
          d(21) = ev(2)
          mu1   = ev(1)
          nu12  = 0.25

        elseif(pcomp(text(1),'ale',3)) then
          imat   = 2
          d(1:2) = ev(1:2)

        elseif(pcomp(text(1),'fsi',3)) then
          imat   = 3

!       Global equations
        elseif(pcomp(text(1),'glob',4)) then

          if(pcomp(text(2),'    ',4) .or. pcomp(text(2),'equa',4)) then
            d(237) = ev(1)
            d(238) = ev(2)
          endif

!       Element (Lagrange multiplier) unknowns
        elseif(pcomp(text(1),'elem',4).or.pcomp(text(1),'lagr',4)) then

          d(230) = ev(1)

!       Formulation type:
        elseif(pcomp(text(1),'form',4)) then
          if(pcomp(text(2),'elem',4)) then
            d(240) = 0.0d0
          elseif(pcomp(text(2),'noda',4)) then
            d(240) = 1.0d0
          endif

!       Element degree of freedoms
        elseif(pcomp(text(1),'dofs',4)) then
          d(241) = ev(1)

!       Consititutive solution start state: Default = elastic (0)
        elseif(pcomp(text(1),'star',4)) then

          if(pcomp(text(2),'elas',4)) then
            d(84)  = 0.0d0
          elseif(pcomp(text(2),'inel',4))then
            d(84)  = 1.0d0
          else
            d(84)  = ev(1)
          endif

!       Geometry type: Cartesian
        elseif(pcomp(text(1),'cart',4)) then
          d(290)     = 1.0d0
          d(291:293) = ev(1:3)

!       Geometry type: Cylindrical
        elseif(pcomp(text(1),'cyli',4)) then
          d(290)     = 2.0d0
          d(291:293) = ev(1:3)

!       Geometry type: Spherical
        elseif(pcomp(text(1),'sphe',4)) then
          d(290)     = 3.0d0
          d(291:293) = ev(1:3)

!       Geometry type: Local
        elseif(pcomp(text(1),'loca',4)) then
          d(290)     = 4.0d0
          d(291:293) = ev(1:3)

!       User Material Parameters
        elseif(pcomp(text(1),'upar',4)) then
          uparfl     = .true.
          d(231:236) = ev(1:6)

!       User Material Model interface
        elseif(pcomp(text(1),'ucon',4) .or. pcomp(text(1),'umat',4) .or.
     &         pcomp(text(1),'fcon',4)) then

!         Default user constitutive equation number
          imat    = 0    ! Clear internal material number for user one
          umat    = 0
          uprm    = ndd - nud
          n1      = 0
          n3      = 0

          uct     = 'read'
          call uconst(text(2),ev, d(1), d(uprm+1),n1,n3, umat)

          if(pcomp(text(1),'ucon',4) .or. pcomp(text(1),'umat',4)) then
            d(uprm) = umat + 100
          else
            d(uprm) = umat + 200
            dtype   = -1
          endif

!         Activate user program models
          uflag  = .true.
          if(mu1.eq.0.0d0) then
            mu1 = 1.0d0
          endif

!         Increase number of history terms/quadrature point
          d(15)  = n1
          nh1    = nh1 + n1
          nh3    = nh3 + n3

!         Check if exit on blank record and backspace
          if (pcomp(xxx,'    ',4) .and. ior.gt.0) then
            inputs = .false.
          endif

!       Check end of data
        elseif(pcomp(text(1),'    ',4)) then

!         Transfer to sets and checks
          inputs = .false.
        endif

      end do ! while

!     Number of stress/strain history terms/pt
      if(ndm.eq.3 .or. stype.eq.8) then    ! 3-d problems
        ntm = 6
      elseif(ndm.eq.2) then                ! 2-d problems
        ntm = 4
      elseif(ndm.eq.1 .and. (stype.eq.3 .or. stype.eq.9)) then
                                           ! 1-d axisym/spherical
        ntm = 4
      else                                 ! 1-pt quadrature
        ntm = 1
      endif

!     PART 3: Set final parameters and output material state

!     Set viscosity
      if(ietype.ne.6) then

!       Navier-Stokes deformation options
        if(sflag) then

          if(imat.ne.8 .and. imat.ne.13) then
            d(1)    = mu1
            d(2)    = nu12
          endif ! imat.ne.8

!         Output parameters for element
          jj   = ii

!         Output viscous properties
          if(eflag) then
            if(imat.eq.1 .or. iflag) then
              if(incomp) then
                d(21) = 0.0d0
                write(iow,2000) wd(stype),d(22)
                if(ior.lt.0) then
                  write(*,2000) wd(stype),d(22)
                endif
              else
                write(iow,2000) wd(stype),d(22),d(21)
                if(ior.lt.0) then
                  write(*,2000) wd(stype),d(22),d(21)
                endif
              endif
            endif
            if(ietype1 .and. qdinp) then
              if(d(182).gt.0.0d0) then
                i = 2
              else
                i = 1
              endif
              write(iow,2019) qd(i),ii,jj
              if(ior.lt.0) then
                write(*,2019) qd(i),ii,jj
              endif
            endif
          elseif(.not.uflag .and. imat.ne.13) then
            write(*,*) 'UFLAG ',uflag,' IMAT ',imat
            write(iow,4000)
            if(ior.lt.0) write(*,4000)
            erflag = .true.
          endif

!         Output initial stress
          if(nint(d(160)).eq.1) then
            if(ndm.eq.2) then
              write(iow,2115) d(161:164)
            else
              write(iow,2115) d(161:166)
            endif
          endif

!       ALE deformation options
        elseif(fflag)then

          write(*,'(a)') 'ALE Not coded'

        endif

!       Output thermal expansions
        if(tflag) then
          write(iow,2002) alp,d(9),tdof
          if(ior.lt.0) then
            write(*,2002) alp,d(9),tdof
          endif
          if(d(129).ne.0.0d0) then
            write(iow,2076) d(129),d(195)
            if(ior.lt.0) then
              write(*,2076) d(129),d(195)
            endif
          endif
          if(max(abs(d(280)),abs(d(281)),abs(d(282))).gt.0.0d0) then
            write(iow,2113) d(280:282)
            if(ior.lt.0) then
              write(*,2113) d(280:282)
            endif
          endif
        endif

!       Output Fourier heat conduction properties
        if(hflag) then
          write(iow,2020) wd(stype),d(61:64),d(66)
          if(d(127).gt.0.0d0) then
            write(iow,2073) d(127),d(128)
          endif
          if(ior.lt.0) then
            write(*,2020) wd(stype),d(61:64),d(66)
            if(d(127).gt.0.0d0) then
              write(*,2073) d(127),d(128)
            endif
          endif
        endif

!       Output activation indicators
        if(d(168).ne.0.0d0) then
          if(ior.lt.0) then
            write(*,2070)
          endif
          write(iow,2070)
        endif
        if(d(169).ne.0) then
          if(ior.lt.0) then
            write(*,2071)
          endif
          write(iow,2071)
        endif

!       Output Transient type
        if(d(89).gt.0.0d0) then
          if(ior.lt.0) then
            write(*,2072) nint(d(89))
          endif
          write(iow,2072) nint(d(89))
        endif

!       Output density and body loading
        if(ior.lt.0) then
          write(*,2029) d(4),d(11),d(12),d(13)
        endif
        write(iow,2029) d(4),d(11),d(12),d(13)

!       Patch loading
        if(max(abs(d(197)),abs(d(198))).gt.0.0d0) then
          write(iow,2095) d(197),d(198)
        endif

!       User body load functions

        if(nint(d(295)).gt.0) then
          if(nint(d(295)).gt.10) then
            write(iow,4020) nint(d(295))
          else
            write(iow,2117) nint(d(295)),d(296)
          endif
        endif

!       Output geometry type
        if(nint(d(290)).gt.0) then
          i = nint(d(290))
          write(iow,2111) gwd(i),(j,d(290+j),j = 1,ndm)
        endif

!       Energy total computation - off only
        if(d(287).ne.0.0d0) then
          write(iow,2109)
          if(ior.lt.0) then
            write(*,2109)
          endif
        endif

!       Rate switch - (on,off) only
        if(d(287).ne.0.0d0) then
          write(iow,2114)
          if(ior.lt.0) then
            write(*,2114)
          endif
        endif

!       Output constant initial stresses
        if(nint(d(160)).eq.1) then
          if(ietype.eq.2 .or. ietype.eq.3) then
            if(oned) then
              j = 1
            else
              j = 6
            endif
          else
            j = 6
          endif
          write(iow,2044) (d(160+i),i=1,j)
          if(ior.lt.0) then
            write(*,2044) (d(160+i),i=1,j)
          endif
        elseif(nint(d(160)).eq.3) then
          if(ietype.eq.2 .or. ietype.eq.3) then
            if(oned) then
              j = 1
            else
              j = 6
            endif
          else
            j = 6
          endif
          write(iow,2045) (d(160+i),i=1,j)
          if(ior.lt.0) then
            write(*,2045) (d(160+i),i=1,j)
          endif
        elseif(nint(d(160)).eq.2) then
          if(ietype.eq.2 .or. ietype.eq.3) then
            naug = 1
            write(iow,2014)
            if(ior.lt.0) then
              write(*,2014)
            endif
          endif
        endif

!       Output ground acceleration factors
        flg = .false.
        efl = .false.
        do i = 1,ndm
          if(nint(d(73+i)).gt.0 ) flg = .true.
          if(nint(d(73+i)).gt.10) then
            efl = .true.
          endif
        end do ! i
        if(flg) then
          write(iow,2023) (d(70+i),nint(d(73+i)),i=1,ndm)
          if(ior.lt.0) then
            write(*,2023) (d(70+i),nint(d(73+i)),i=1,ndm)
          endif
        endif

        if(efl) then
          write(iow,4007)
          if(ior.lt.0) write(*,4007)
          erflag = .true.
        endif

!       Output quadrature data
        if(.not.qdflg .and. qdinp) then
          write(iow,2019) qd(ti),ii,jj
          if(ior.lt.0) then
            write(*,2019) qd(ti),ii,jj
          endif
        endif

!       Constitutive start (.ne.0 for nonclassical elastic)
        if(d(84).eq.0.0d0) then
          write(iow,2066) 'Elastic'
          if(ior.lt.0) then
            write(*,2066) 'Elastic'
          endif
        else
          write(iow,2066) 'Inelastic'
          if(ior.lt.0) then
            write(*,2066) 'Inelastic'
          endif
        endif

!       Kinematics type
        if(ietype.ne.6) then
          i = min(etype,5)
          write(iow,2005)
          if(ior.lt.0) then
            write(*,2005)
          endif
        endif

!       Hierarchical formulation
        if(d(120).gt.0) then
          write(iow,2081)
          if(ior.lt.0) then
            write(*,2081)
          endif

        endif

!       Element type
        if(ietype.eq.1) then
          if(etype.eq.1) then
            write(iow,2012) 'Velocity-Pressure (QnPm)'
            if(ior.lt.0) then
              write(*,2012) 'Velocity-Pressure (QnPm)'
            endif
          elseif(etype.eq.2) then
            write(iow,2012) 'Velocity-Pressure (Dohrmann/Bochev)'
            if(ior.lt.0) then
              write(*,2012) 'Velocity-Pressure (Dohrmann/Bochev)'
            endif
          elseif(etype.eq.3) then
            write(iow,2012) 'Velocity-Pressure (Taylor-Hood)'
            if(ior.lt.0) then
              write(*,2012) 'Velocity-Pressure (Taylor-Hood)'
            endif
          elseif(etype.eq.4) then
            write(iow,2012) 'Velocity-Pressure (Donea Split)'
            if(ior.lt.0) then
              write(*,2012) 'Velocity-Pressure (Donea Split)'
            endif
          elseif(etype.eq.5) then
            write(iow,2012) 'Velocity-Pressure (Chorin Split)'
            if(ior.lt.0) then
              write(*,2012) 'Velocity-Pressure (Chorin Split)'
            endif
          elseif(etype.eq.6) then
            write(iow,2012) 'Vel-Pressure (CBS: Taylor-Galerkin Split)'
            if(ior.lt.0) then
              write(*,2012) 'Vel-Pressure (CBS: Taylor-Galerkin Split)'
            endif
          elseif(etype.eq.9) then
            write(iow,2012) 'ALE'
            if(ior.lt.0) then
              write(*,2012) 'ALE'
            endif
          endif
          if(incomp) then
            write(iow,2067)
            if(ior.lt.0) then
              write(*,2067)
            endif
          endif
          if(nint(d(31)).eq.1) then
            write(iow,2001) nint(d(34))
            if(ior.lt.0) then
              write(*,2001) nint(d(34))
            endif
          endif
        endif

!       Output plot indicator
        if(nint(d(171)).eq.1) then
          if(ior.lt.0) then
            write(*,2093) 'Off'
          endif
          write(iow,2093) 'Off'
        else
          if(ior.lt.0) then
            write(*,2093) 'On'
          endif
          write(iow,2093) 'On'
        endif

!       Output augmentation option
        if(etype.gt.1) then
          if(d(185).gt.0.0d0) then
            write(iow,2084) 'On'
            if(ior.lt.0) then
              write(*,2084) 'On'
            endif
          else
            write(iow,2084) 'Off'
            if(ior.lt.0) then
              write(*,2084) 'Off'
            endif
          endif
        endif

!     Thermal element only
      elseif(ietype.eq.6) then

        write(iow,2020) wd(stype),(d(i),i=61,64),d(66),d(4)
        if(d(127).gt.0.0d0) then
          write(iow,2073) d(127),d(128)
        endif
        if(ior.lt.0) then
          write(*,2020) wd(stype),(d(i),i=61,64),d(66),d(4)
          if(d(127).gt.0.0d0) then
            write(*,2073) d(127),d(128)
          endif
        endif
        if(qdinp) then
          if(d(182).gt.0.0d0) then
            j = 2
          else
            j = 1
          endif
          write(iow,2019) qd(j),ii,jj
          if(ior.lt.0) then
            write(*,2019) qd(j),ii,jj
          endif
        endif

      endif

!     Interpolation type
      if(nint(d(189)).eq.1) then
        write(iow,2090) 'Global NURBS',(i,nint(d(189+i)),i=1,ndm)
        if(ior.lt.0) then
          write(*,2090) 'Global NURBS',(i,nint(d(189+i)),i=1,ndm)
        endif
      elseif(nint(d(189)).eq.2) then
        write(iow,2090) 'Local NURBS',(i,nint(d(189+i)),i=1,ndm)
        if(ior.lt.0) then
          write(*,2090) 'Local NURBS',(i,nint(d(189+i)),i=1,ndm)
        endif
      elseif(nint(d(189)).eq.3) then
        write(iow,2090) 'B-Spline',(i,nint(d(189+i)),i=1,ndm)
        if(ior.lt.0) then
          write(*,2090) 'B-Spline',(i,nint(d(189+i)),i=1,ndm)
        endif
      elseif(nint(d(189)).eq.4) then
        write(iow,2090) 'T-Spline',(i,nint(d(189+i)),i=1,ndm)
        if(ior.lt.0) then
          write(*,2090) 'T-Spline',(i,nint(d(189+i)),i=1,ndm)
        endif
      elseif(nint(d(189)).eq.5) then
        write(iow,2090) 'Bezier  ',(i,nint(d(189+i)),i=1,ndm)
        if(ior.lt.0) then
          write(*,2090) 'Bezier  ',(i,nint(d(189+i)),i=1,ndm)
        endif
      elseif(nint(d(189)).eq.6) then
        write(iow,2090) 'NURBS Mixed',(i,nint(d(189+i)),i=1,ndm)
        if(ior.lt.0) then
          write(*,2090) 'NURBS Mixed',(i,nint(d(189+i)),i=1,ndm)
        endif
      elseif(nint(d(189)).eq.7) then
        write(iow,2090) 'H-Spline',(i,nint(d(189+i)),i=1,ndm)
        if(ior.lt.0) then
          write(*,2090) 'H-Spline',(i,nint(d(189+i)),i=1,ndm)
        endif
      elseif(nint(d(189)).eq.8) then
        write(iow,2090) 'VEM',(i,nint(d(189+i)),i=1,ndm)
        if(ior.lt.0) then
          write(*,2090) 'VEM',(i,nint(d(189+i)),i=1,ndm)
        endif
      elseif(nint(d(189)).eq.9) then
        write(iow,2090) 'Bernstein Polynomials'
        if(ior.lt.0) then
          write(*,2090) 'Bernstein Polynomials'
        endif
      elseif(nint(d(189)).eq.10) then
        write(iow,2090) 'Hierarchical Polynomials'
        if(ior.lt.0) then
          write(*,2090) 'Hierarchical Polynomials'
        endif
      else
        write(iow,2090) 'Lagrangian Polynomials'
        if(ior.lt.0) then
          write(*,2090) 'Lagrangian Polynomials'
        endif
      endif

!     Mass type
      if(d(4).gt.0.0d0) then
        if(d(7).eq.0.0d0) then
          write(iow,2007)
          if(ior.lt.0) then
            write(*,2007)
          endif
        elseif(d(7).eq.1.0d0) then
          write(iow,2008)
          if(ior.lt.0) then
            write(*,2008)
          endif
        else
          write(iow,2009) d(7)
          if(ior.lt.0) then
            write(*,2009) d(7)
          endif
        endif
        if(d(183).ne.0.0d0) then
          write(iow,2082) d(183)
          if(ior.lt.0) then
            write(*,2082) d(183)
          endif
        endif
      endif

!     Damping factor
      if(d(70).gt.0.0d0) then
        write(iow,2046) d(70)
        if(ior.lt.0) then
          write(*,2046) d(70)
        endif
      endif

!     Number of internal element (Lagrange multiplier) variables
      if(nint(d(230)).ne.0) then
        write(iow,2069) nint(d(230))
        if(ior.lt.0) then
          write(iow,2069) nint(d(230))
        endif
      endif

!     Number of active element degrees of freedom per node
      if(nint(d(241)).gt.0) then
        write(iow,2098) nint(d(241))
        if(ior.lt.0) then
          write(iow,2098) nint(d(241))
        endif
      endif

!     Output nodal based formulation
      if(nint(d(240)).ne.0) then
        write(iow,2099)
        if(ior.lt.0) then
          write(iow,2099)
        endif
      endif

!     Error value
      if(d(50).ne.0.0d0) then
        write(iow,2011) d(50)
        if(ior.lt.0) then
          write(*,2011) d(50)
        endif
      endif

!     Nonlinear analaysis
      if(d(39).ne.0.0d0) then
        write(iow,2016)
        if(ior.lt.0) then
          write(*,2016)
        endif
      endif

!     Output penalty value

      if(d(60).ne.0.0d0) then
        write(iow,2022) d(60)
        if(ior.lt.0) then
          write(*,2022) d(60)
        endif
      endif

!     Output reference coordinate/vector
      if    (sref.eq.1) then
        d(93) = sref
        do i = 1,2
          d(93+i) = tref(i)
        end do ! i

        write(iow,2031) (i,tref(i),i=1,2)
        if(ior.lt.0) then
          write(*,2031) (i,tref(i),i=1,2)
        endif
      endif

!     Output reference coordinate/vector

      if(lref.gt.0) then
        d(96) = lref
        do i = 1,3
          d(96+i) = refx(i)
        end do ! i
      endif
      if    (lref.eq.1) then

        write(iow,2025) (i,refx(i),i=1,ndm)
        if(ior.lt.0) then
          write(*,2025) (i,refx(i),i=1,ndm)
        endif

      elseif(lref.eq.2) then

        write(iow,2026) (i,refx(i),i=1,ndm)
        if(ior.lt.0) then
          write(*,2026) (i,refx(i),i=1,ndm)
        endif

      elseif(lref.eq.3) then

        write(iow,2079)
        if(ior.lt.0) then
          write(*,2079)
        endif

      elseif(lref.eq.4) then

        write(iow,2064)
        if(ior.lt.0) then
          write(*,2064)
        endif

      endif

!     Output number global equations
      if(nint(d(237)).gt.0) then
        write(iow,2106) nint(d(237)),nint(d(238))
        if(ior.lt.0) then
          write(*,2106) nint(d(237)),nint(d(238))
        endif
!       nge = nint(d(237))
      endif

!     Output user parameters
      if(uparfl) then

        j = 0
        do i = 1,6
          if(d(230+i).ne.0.0d0) then
            j = i
          endif
        end do ! i

        write(iow,2068) (i,d(230+i),i=1,j)
        if(ior.lt.0) then
          write(*,2068) (i,d(230+i),i=1,j)
        endif

      endif

!     Save quadrature
      if(qdinp .or. (ietype.ne.1 .and. ietype.ne.6)) then
        d(5) = ii
      endif

!     Save types
      istp   = stype
      if(oned) then
        d(3) = alp(1)
      else
        d(3) = alp(1) + alp(2) + alp(3)
      endif
      d(15)  = nh1 + naug ! nh
      d(16)  = stype
      d(17)  = etype
      d(18)  = dtype
      d(19)  = tdof
      d(20)  = imat
      d(193) = tmat
      d(194) = ietype
      d(286) = nh3 + ndel ! Element + delete

!     Output number of history terms per pt.
      write(iow,2123) nint(d(15))
      if(ior.lt.0) then
        write(*,2123) nint(d(15))
      endif

!     Fluid (1)

      if(ietype1) then
        nh2   = nh1

!       Set 2 and 3 dimensional quadrature order for FE elements
        jj    = ii
        j     = ii

!       Set 2 and 3 dimensional quadrature order for NURB elements
        if(nint(d(189)).gt.0) then
          ii = nint(d(190))
          jj = nint(d(191))
          j  = nint(d(192))
        endif

!       Increase history storage for multiple quadrature points
        if(ndm.eq.1 .and. ietype1) then
          nh1 = nh1*ii
        elseif(ndm.eq.2) then
          nh1 = nh1*ii*jj
        elseif(ndm.eq.3) then
          nh1 = nh1*ii*jj*j
        endif

      elseif(ietype.eq.6) then
        nh1   = nh1*ii**ndm

!     Three dimensional (7)
      elseif(ietype.eq.7) then
        nh1   = nh1*ii**3
      endif

!     Set history for saving element variables
      nh3    = nh3 + ndv + ndel

!     Set augmenting base value
      d(185) = d(185)*d(21)

!     Set number of element variables
      nlm  = nint(d(230))

!     Check for warnings
      if(d(4).eq.0.0d0) then
        write(iow,3100)
        if(ior.lt.0) then
          write(*,3100)
        endif
      endif

!     Check for errors
      if     (ietype.eq.1) then
        if(mu1.eq.0.0d0) then
          write(iow,4001)
          if(ior.lt.0) then
            write(*,4001)
          endif
        endif
      elseif (ietype.eq.6) then
        if(t1.eq.0.0d0) then
          write(iow,4004)
          if(ior.lt.0) then
            write(*,4004)
          endif
        endif
      endif

!     Output user history information
      if(uflag) then
        write(iow,5000) nint(d(15)),nh1,nh3
      endif

!     Errors detected in inputs
      if(erflag) call plstop(.true.)

!     I/O Formats

2000  format( 5x,'N e w t o n i a n   P r o p e r t i e s'//
     & 10x,a,' Analysis'//
     & 10x,'Viscosity   (mu)',1p,1e12.5:/
     & 10x,'Lambda     (lam)',1p,1e12.5/)

2001  format(/10x,'Compute stream function for plotting'/
     &        10x,'Degree of Freedom ',i6/1x)

2002  format(/5x,'T h e r m a l   E x p a n s i o n s'//
     & 10x,'Th. Alpha-1',1p,1e17.5/10x,'Th. Alpha-2',1p,1e17.5/
     & 10x,'Th. Alpha-3',1p,1e17.5/10x,'T_0        ',1p,1e17.5/
     & 10x,'Th. D.O.F. ',i7/)

2005  format(/5x,'E l e m e n t    M o d e l'//
     &       10x,'Formulation  : Navier Stokes ')

2007  format(10x,'Mass type    : Lumped.')
2008  format(10x,'Mass type    : Consistent.')
2009  format(10x,'Mass type    : Interpolated:',1p,1e11.4)

2011  format(10x,'Error estimator ',1p,1e12.5 )

2012  format(10x,'Element type : ',a)

2014  format(/10x,'Augmented Solution for Inextensible Behavior')

2016  format( 10x,'Non-linear analysis')

2019  format(/5x,a,'   Q u a d r a t u r e'/
     & 10x,'Quadrature: Arrays',i3    /10x,'Quadrature: Output',i3/)

2020  format(/5x,'T h e r m a l   P r o p e r t i e s'//
     & 10x,a,' Analysis'//
     & 10x,'Cond. K-1    ',1p,1e15.5/ 10x,'Cond. K-2    ',1p,1e15.5/
     & 10x,'Cond. K-3    ',1p,1e15.5/ 10x,'Specific Heat',1p,1e15.5/
     & 10x,'Heat Source  ',1p,1e15.5/:10x,'Density      ',1p,1e15.5)

2022  format( 10x,'Penalty - k ',1p,1e16.5/1x)

2023  format(
     &    /5x,'P r o p o r t i o n a l   B o d y   L o a d i n g s',/
     &   /10x,'1-Dir. Factor',1p,1e15.5,': Prop. Load No.',i3:
     &   /10x,'2-Dir. Factor',1p,1e15.5,': Prop. Load No.',i3:
     &   /10x,'3-Dir. Factor',1p,1e15.5,': Prop. Load No.',i3)

2025  format(/5x,'R e f e r e n c e    C o o r d i n a t e s'//
     &        (10x,'X-',i1,' = ',1p,1e12.5:))

2026  format(/5x,'R e f e r e n c e    V e c t o r'//
     &        (10x,'v-',i1,' = ',1p,1e12.5:))

2029  format(10x,'Density         ',1p,1e12.5//
     &       10x,'1-Gravity Load  ',1p,1e12.5/
     &       10x,'2-Gravity Load  ',1p,1e12.5/
     &       10x,'3-Gravity Load  ',1p,1e12.5)

2031  format(/5x,'S h e a r   C e n t e r   C o o r d i n a t e s'//
     &        (10x,'X-',i1,' = ',1p,1e12.5:))

2044  format(/5x,'I n i t i a l   S t r e s s   D a t a'//
     &       10x,'11-Stress         =',1p,e13.4/:
     &       10x,'22-Stress         =',1p,e13.4/
     &       10x,'33-Stress         =',1p,e13.4/
     &       10x,'12-Stress         =',1p,e13.4/
     &       10x,'23-Stress         =',1p,e13.4/
     &       10x,'31-Stress         =',1p,e13.4/)

2045  format(/5x,'I n i t i a l   S t r a i n   D a t a'//
     &       10x,'11-Strain         =',1p,e13.4/:
     &       10x,'22-Strain         =',1p,e13.4/
     &       10x,'33-Strain         =',1p,e13.4/
     &       10x,'12-Strain         =',1p,e13.4/
     &       10x,'23-Strain         =',1p,e13.4/
     &       10x,'31-Strain         =',1p,e13.4/)

2046  format( 10x,'Damping     ',1p,1e16.5)

2064  format(/10x,'Axial Reference Vector')

2066  format(/5x,'C o n s t i t u t i v e    S t a r t'//
     &       10x,'Start state  : ',a)

2067  format(/10x,'Incompressible Formulation')

2068  format(/5x,'U s e r   P a r a m e t e r s'//
     &      (10x,'Parameter',i3,'   =',1p,e13.4:))

2069  format( 5x,'E l e m e n t   V a r i a b l e s'//
     &       10x,'Number/element    =',i3/)

2070  format( 10x,'Activation thermal')
2071  format( 10x,'Activation mechanical')

2072  format( 10x,'Constitutive equation transient type =',i5/
     &        15x,' 1 = Euler   Method'/
     &        15x,' 2 = Newmark Method'/
     &        15x,' 3 = User    Method')

2073  format(/5x,'S u r f a c e   C o n v e c t i o n'/
     &       10x,'Convection  (h)    ',1p,1e15.5/
     &       10x,'Temperature (T_inf)',1p,1e15.5)

2076  format( 8x,'Absolute Reference Temperature'//
     &       10x,'Temperature (T_ref)',1p,1e15.5/
     &       10x,'Heat fraction (r_H)',1p,1e15.5)

2079  format(/5x,'C y l i n d r i c a l    R e f e r e n c e   ',
     &           'V e c t o r'/)

2081  format( 8x,'Hierarchical formulation')

2082  format( 10x,'Mass scaling factor  - b_m:',1p,1e12.5)

2084  format( 10x,'Augmenting   : ',a)

2090  format(10x,'Interpolation: ',a:/(15x,'Quadrature ',i1,' = ',i5:))

2093  format(10x,'Plot Output  : ',a)

2095  format(/10x,'Body Patch Loading'/
     &        10x,'1-Body Load     ',1p,1e12.5/
     &        10x,'2-Body Load     ',1p,1e12.5/)

2098  format( 5x,'E l e m e n t   A c t i v e   V a r i a b l e s'//
     &       10x,'Number dof/node   =',i3/)

2099  format(10x,'Nodal Based Element Groups.')

2106  format(/10x,'Global Equations ',i5/
     &        10x,'Global Partition ',i5)

2109  format(10x,'Energy and momentum computation off')

2111  format(/8x,'Geometry: ',a/10x,'Origin:',3(i2,' =',1p,1e12.4))

2113  format(/8x,'Elastic Thermal Dependent Parameters'//
     &       10x,'Constant      g1',1p,1e13.5/
     &       10x,'Coefficient   g2',1p,1e13.5/
     &       10x,'Exponent      g3',1p,1e13.5)

2114  format(10x,'Rate switch is on')

2115  format(/8x,'Initial Stress Values'/
     &       10x,'Sigma_11        ',1p,1e13.5/
     &       10x,'Sigma_22        ',1p,1e13.5/
     &       10x,'Sigma_33        ',1p,1e13.5/
     &       10x,'Sigma_12        ',1p,1e13.5:/
     &       10x,'Sigma_23        ',1p,1e13.5/
     &       10x,'Sigma_31        ',1p,1e13.5)

2117  format(/10x,'User Body Loading'/
     &        10x,'Load number     ',i8/
     &        10x,'Parameter set   ',1p,1e12.5)

2123  format(10x,'History terms/pt  =',i6)

3100  format(/5x,'W a r n i n g s   &   E r r o r s'/
     &       10x,'Material density is zero.')

4000  format(/' *ERROR* INFLUID: No viscous properties input.'/)

4001  format(/' *ERROR* INFLUID: Fluid Element: Viscosity zero.')

4004  format(/' *ERROR* INFLUID: Thermal: Conductivity zero.')

4007  format(/' *ERROR* INFLUID: Incorrect proportional load number'/)

4020  format(/' *ERROR* INFLUID: Maximum user body force is 10: Input=',
     &        i5)

!     User function Formats

5000  format(//5x,'U s e r   H i s t o r y   I n f o r m a t i o n'//
     &        10x,'Number of history variables/quad point    ',i8/
     &        10x,'Number of history variables total         ',i8/
     &        10x,'Number of element history variables total ',i8/)

      end subroutine influid
