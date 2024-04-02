!$Id:$
      subroutine flu2d4(d,ul,xl,ix,tl,s,r,ndf,ndm,nst,isw)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2024: Regents of the University of California

!-----[--.----+----.----+----.-----------------------------------------]
!     Modification log                                Date (dd/mm/year)
!       Original version                                    01/11/2006
!       1. Add boundary integral for E                      07/03/2019
!-----[--.----+----.----+----.-----------------------------------------]
!     Purpose: 2-D Navier Stokes solution by Donea split algorithm
!              Q1/P0 or (Q2/P1 - not coded)

!     Ref:    "Finite element solution of unsteady {Navier-Stokes}
!              equations by a fractional step method", by
!              J. Donea, S. Giuliani, H. Laval and L. Quartapelle,
!              Comp. Meth. Appl. Mech. & Engr., v33:53-73, 1982.

!     Inputs:
!       d(*)          - Material set parameters
!       ul(ndf,nen,*) - Solution parameters
!       xl(ndm,nen)   - Element nodal coordinates
!       ix(nen1)      - Element global node numbers
!       tl(nen)       - Element vector (e.g., nodal temperatures)
!       ndf           - Maximum no dof's/node
!       ndm           - Mesh spatial dimension
!       nst           - Element matrix/vector dimension
!       isw           - Switch parameter (set by input commands)

!     Outputs:
!       s(nst,nst,2)  - Element matrix (stiffness, mass, etc.)
!       p(nst,2)      - Element vector (residual, lump mass, etc.)
!-----[--.----+----.----+----.-----------------------------------------]
      implicit   none

      include   'bdata.h'
      include   'cdata.h'
      include   'elcapt.h'
      include   'eldata.h'
      include   'hdata.h'
      include   'iofile.h'
      include   'part0.h'
      include   'pconstant.h'
      include   'pmod2d.h'
      include   'prstrs.h'
      include   'ptdat6.h'
      include   'qudshp.h'
      include   'strnum.h'
      include   'tdata.h'
      include   'umac1.h'

      include   'pointer.h'
      include   'comblk.h'

      include   'split1.h'
      include   'fdata.h'
      include   'lmdata.h'
      include   'ndata.h'
      include   'debugs.h'

      integer       :: ndf,ndm,nst,isw
      integer       :: i, j, l, nn,nhv, istrt
      integer       :: split

      real (kind=8) :: pp,px,  dx, dmas, alam,ha, ta, div_v

      logical       :: p_profil, fluidel
      integer       :: ix(*)
      real (kind=8) :: d(*),ul(ndf,nen,*),xl(ndm,*),tl(*)
      real (kind=8) :: s(nst,*),r(ndf,nen)
      real (kind=8) :: dd(6,6,5,7),eps(9,3), epsv(16)
      real (kind=8) :: uu(3,3,25), gradv(3,3,3,25), xx(2)
      real (kind=8) :: pr(25)

      real (kind=8) :: rhoj, tlen
      real (kind=8) :: conv(3), bf(3), uni(2), tt(2),nvec(2)
      real (kind=8) :: x0(2),ph(3)

      save

!     TEMPORARY SET OF TEMPERATURE VALUE
      data       ta      /      0.0d0            /

!     Extract type data
      stype = nint(d(16))
      etype = nint(d(17))
      dtype = nint(d(18))

!     Output element type
      if(isw.eq.0 .and. ior.lt.0) then

        write(*,*) '   FLU2d4: 2-d Donea Q1/P0 split fluid element'

!     Input material properties
      elseif(isw.eq.1) then

!       Deactivate dof in element for dof > 5
        if(ndf.lt.5) then
          write(iow,3000) ndf
          call plstop(.true.)
        else

!         Check for streamlines
          if(nint(d(31)).gt.0) then
            ix(7:ndf) = 0
          else
            ix(6:ndf) = 0
          endif
          call iprint(ix,1,ndf,1,'IX_DOF_MAP')

!         Set captions
          dcapt(1) = '  u_1 VELOCITY   '
          dcapt(2) = '  u_2 VELOCITY   '
          dcapt(4) = ' ustar_1 VELOCITY'
          dcapt(5) = ' ustar_2 VELOCITY'

        endif

!       Set large value of element size (isw=14 does real value)
        dx   = 1.0d+15

        d(170) = 5.0d0     ! Force incompressible NS
        if(nen.le.4) then
          nlm = 1          ! Element pressure variables for Q4
        elseif(nen.le.9) then
          nlm = 3          ! Element pressure variables for Q9
        else
          nlm = 6          ! Element pressure variables for Q16
        endif
        plm = nint(d(32))  ! Partition number

!     Check element for errors in input data
      elseif(isw.eq.2) then

        if(nel.eq.2 .or. nel.eq.3) then

        elseif(nel.eq.4 .or. nel.eq.9 .or. nel.eq.16) then
          call ckisop(ix,xl,shp2,ndm)
        else
          write(*,*) ' No check feature for',nel,' node elements'
        endif

!     Other options
      elseif(isw.ne.14) then

!       Solution for u^star
        if(ndfp(4).eq.npart) then
          split = 1

!       Solution for p_n+1
        elseif(ndfp(3).eq.npart) then
          split = 2

!         Profile for pressure tangent: C^T * M^{-1} * C
          if(p_profil) then
            na    = np(npart)
            nau   = na + neq
            nal   = nau
            fl(4) = .false.  ! Tangent formed by 'SPLIT' commands
            call pmovei(mr(np(228)),mr(np(20+npart)),neq)
            p_profil = .false.
            if(debug) then
              write(*,*) ' ELMT17: FL(4) = ',fl(4)
              write(*,*) ' NA  =',na
              write(*,*) ' NAU =',nau
              write(*,*) ' NEQ =',neq
              write(*,*) ' JP  =',np(228)
            endif
          elseif(dt.le.0.0d0) then
            write(*,3001)
            call plstop(.true.)
          endif

!       Solution for u_n+1
        else
          split = 3

        endif

!       1-d boundary elements
        if(nel.eq.2 .or. nel.eq.3) then

!         Indicates boundary element
          fluidel = .false.

!         Compute Gauss quadrature points and weights
          call quadr1d(d)

!         Shape functions and derivatives
          do l = 1,lint
            call interp1d(l, xl, ndm,nel,.false.)
          end do ! l

!       2-d fluid elements
        elseif(nel.eq.4 .or. nel.eq.9) then

!         Indicates fluid element
          fluidel = .true.

!         Compute Gauss quadrature points and weights
          call quadr2d(d,.false.)

!         Center estimate
          if(nel.eq.9) then
            x0(:) = 0.0d0
            do j = 1,nel
              x0(:) = x0(:) + xl(1:2,j)
            end do ! j
            x0(:) = x0(:)/dble(nel)
          endif

!         Shape functions and derivatives
          do l = 1,lint
            call interp2d(l,xl,ix,ndm,nel, .false.)
          end do ! l
        endif

!       Form 'C' & 'M' array for pressure projection
        if(isw.eq.31) then

          if(fluidel) then
            cl(:,:) = 0.0d0
            ml(:)   = 0.0d0
            do l = 1,lint

!             4-node quad only with constant pressure
              if(nel.eq.4) then
                pp = jac(l)
                px = pp*d(4)
                do i = 1,nel
!                 Pressure and continuity matrix
                  cl(1,2*i-1) = cl(1,2*i-1) + pp*shp2(1,i,l)
                  cl(1,2*i  ) = cl(1,2*i  ) + pp*shp2(2,i,l)
!                 Row sum mass
                  ml(2*i-1) = ml(2*i-1) + px*shp2(3,i,l)
                  ml(2*i  ) = ml(2*i  ) + px*shp2(3,i,l)
                end do ! i
!             9-node quad with linear pressure
              elseif(nel.eq.9) then
                ph(  1) = 1.0d0
                ph(2:3) = -x0(:)
                do i = 1,nel
                  ph(2:3) = ph(2:3) + xl(1:2,i)*shp2(3,i,l)
                end do ! i
                ph(:) = ph(:)*jac(l)
                px    = d(4)*jac(l)
                do i = 1,nel
!                 Pressure and continuity matrix
                  cl(1:3,2*i-1) = cl(1:3,2*i-1) + ph(:)*shp2(1,i,l)
                  cl(1:3,2*i  ) = cl(1:3,2*i  ) + ph(:)*shp2(2,i,l)
!                 Row sum mass
                  ml(2*i-1) = ml(2*i-1) + px*shp2(3,i,l)
                  ml(2*i  ) = ml(2*i  ) + px*shp2(3,i,l)
                end do ! i
              endif ! element types
            end do ! l
          endif

        elseif(isw.eq.3) then

!         if(n_el.eq.1) write(*,*) ' NO TANGENT REQUIRED'

        elseif(isw.eq.6) then

          if(fluidel) then
!           History variable
            nhv   = nint(d(15))
            istrt = nint(d(84))

!           Body force vector
            call sbodyf(d, bf)

!           Quadrature loop
            nn    = 0
            do l = 1,lint

!             Step 1: Compute u-star (dt included at solution)
              if(split.eq.1) then

!               Compute velocity & strain rate at t_n
                call strnr2d(d,xl,ul,tl,shp2(1,1,l),ndm,ndf,nel,
     &                       uu(1,1,l), gradv(1,1,1,l), eps, ta)

!               Volumetric strain rate at t_n
!               epsv(l) = (eps(1,2) + eps(2,2) + eps(3,2))*one3
                epsv(l) = 0.0d0

!               Compute stress (no pressure)
                call modlfl(l,d,ta,eps(1,1),epsv(l),
     &                      hr(nn+nh1),hr(nn+nh2),nhv,
     &                      istrt,dd(1,1,1,l),sigp(1,l),alam,ha,isw)
                nn = nn + nhv

!               Stress at t_n
                sigp(:,l) = sigp(:,l)*jac(l)

!               Convective term
                rhoj    = d(4)*jac(l)
                conv(:) = (gradv(:,1,1,l)*uu(1,1,l)
     &                  +  gradv(:,2,1,l)*uu(2,1,l)) * rhoj
                rhoj    = rhoj/dt

!               Compute residual
                do i = 1,nel
                  uni(:) = ul(1:2,i,1) - ul(1:2,i,2)      ! u_n(:)
                  r(4,i) = r(4,i) - shp2(1,i,l)*sigp(1,l)
     &                            - shp2(2,i,l)*sigp(4,l)
     &                            - shp2(3,i,l)*conv(1)
     &                   - rhoj*shp2(3,i,l)*(ul(4,i,1) - uni(1))
                  r(5,i) = r(5,i) - shp2(1,i,l)*sigp(4,l)
     &                            - shp2(2,i,l)*sigp(2,l)
     &                            - shp2(3,i,l)*conv(2)
     &                   - rhoj*shp2(3,i,l)*(ul(5,i,1) - uni(2))
                end do ! i

!             Step 2: Compute pressure (assume u^T n = 0)
              elseif(split.eq.2) then

!               Compute the divergence
                div_v = 0.0d0
                do i = 1,nel
                  div_v = div_v + shp2(1,i,l)*ul(4,i,1)
     &                          + shp2(2,i,l)*ul(5,i,1)
                end do ! i
!               4-node quadrilateral
                if(nel.eq.4) then
                  r(1,nel+1) = r(1,nel+1) - div_v*jac(l)/dt
!               9-node quadrilateral
                elseif(nel.eq.9) then
                  ph(  1) = 1.0d0
                  ph(2:3) = -x0(:)
                  do i = 1,nel
                    ph(2:3) = ph(2:3) + xl(1:2,i)*shp2(3,i,l)
                  end do ! i
                  ph(:) = ph(:)*jac(l)
                  r(1,nel+1) = r(1,nel+1) - ph(1)*div_v/dt
                  r(1,nel+2) = r(1,nel+2) - ph(2)*div_v/dt
                  r(1,nel+3) = r(1,nel+3) - ph(3)*div_v/dt
                endif

!             Step 3: Compute u_n+1
              elseif(split.eq.3) then

!               if(n_el.lt.6) then
!                 write(iow,'(a,i4,1p,1e12.4)') 'ULE',n_el,ule(1,1)
!                 write(  *,'(a,i4,1p,1e12.4)') 'ULE',n_el,ule(1,1)
!               endif
!               Compute pressure and displacement difference
                pp   = ule(1,1)
!               9-node element
                if(nel.eq.9) then
                  ph(2:3) = -x0(:)
                  do i = 1,nel
                    ph(2:3) = ph(2:3) + xl(1:2,i)*shp2(3,i,l)
                  end do ! i
                  pp = pp + ule(2,1)*ph(2) + ule(3,1)*ph(3)
                endif
                pp   = pp * jac(l)
                rhoj = d(4)*jac(l)/dt
                bf(:)= bf(:)*jac(l)

!               Step 3: Residual (dt included at solution)
                do i = 1,nel
                  r(1:2,i) = r(1:2,i) + bf(1:2)*shp2(3,i,l)
     &                     + shp2(1:2,i,l)*pp
     &                     - rhoj*shp2(3,i,l)*(ul(1:2,i,1)-ul(4:5,i,1))
                end do ! i
              endif
            end do ! l

!         Boundary element
          else
            if(split.eq.2) then

!             Tangent & normal vectors
              do l = 1,lint
!               Compute tangent vector
                tt(:) = 0.0d0
                do i = 1,nel
                  tt(:) = tt(:) + xl(1:2,i)*shp1(1,i,l)
                end do ! i
                tlen    = sqrt(tt(1)*tt(1) + tt(2)*tt(2))
                tt(:)   = tt(:)/tlen
!               Compute normal vector divided by dt
                nvec(1) = -tt(2)/dt
                nvec(2) =  tt(1)/dt
!               Compute boundary residual
                do i = 1,nel
                  r(1,nen+1) = r(1,nen+1)
     &                       - shp1(2,i,l)*(nvec(1)*ul(1,i,1)
     &                                    + nvec(2)*ul(2,i,1))*jac(l)
                end do ! i
              end do ! l
!             call mprint(r(1,nen+1),1,1,1,'E_pre')
            endif

          endif

        elseif(isw.eq.5) then

          if(fluidel) then
            do l = 1,lint
              dmas = d(4)*jac(l)
              do i = 1,nel
                do j = 1,5
                  r(j,i) = r(j,i) + shp2(3,i,l)*dmas
                end do ! j
              end do ! i
            end do ! l
          endif

!       Output stresses
        elseif(isw.eq.4 .or. isw.eq.8) then

!         Fluid element outputs
          if(fluidel) then
            nn = 0
            do l = 1,lint

!             Compute strain rate at t_n
              call strnr2d(d,xl,ul,tl,shp2(1,1,l),ndm,ndf,nel,
     &                     uu(1,1,l), gradv(1,1,1,l), eps, ta)

!             Volumetric strain rate at t_n
!             epsv(l) = (eps(1,1) + eps(2,1) + eps(3,1))*one3
              epsv(l) = 0.0d0

!             Compute stress (no pressure)
              call modlfl(l,d,ta,eps(1,1),epsv(l),hr(nn+nh1),hr(nn+nh2),
     &                    nhv,istrt,dd(1,1,1,l),sigp(1,l),alam,ha,isw)
              epsv(l) = (eps(1,1) + eps(2,1) + eps(3,1))*one3
              nn = nn + nhv
!             Pressure
              pr(l) = ule(1,1)

              if(isw.eq.4) then
                xx(:) = 0.0d0
                do i = 1,nel
                  xx(:) = xx(:) + xl(1:2,i)*shp2(3,i,l)
                end do ! i
                mct = mct - 2
                if(mct.le.0) then
                  write(iow,2001) o,head
                  if(ior.lt.0) write(*,2001) o,head
                  mct = 50
                endif

                write(iow,2002) n_el,ma,sigp(1:6,l),xx,pr(l)
                if(ior.lt.0) then
                  write(*,2002) n_el,ma,sigp(1:6,l),xx,pr(l)
                end if
              endif
            end do ! l

!           Project stress values to nodes
            if(isw.eq.8) then

              call flcn2d(sigp,pr,epsv,r,s,nel,10)
            endif
          else
            iste = 1
          endif
        endif

!     Automatic for isw.eq.14
      else

        do i = 1,min(4,nel)
          j = mod(i,4) + 1
          dx = min(dx,(xl(1,j)-xl(1,i))**2 + (xl(2,j)-xl(2,i))**2)
        end do ! i
        if(n_el.eq.numel) then
          dx = sqrt(dx)
          write(iow,*) ' Min. L =  ',dx
          write(  *,*) ' Min. L =  ',dx
        endif

!       Set to force computations when split = 2
        p_profil = .true.

      endif

!     Formats for input-output

2000  format(5x,'D o n e a    A l g o r i t h m    P a r a m e t e r s')

2001  format(a1,20a4//5x,'Element Stresses'//'  Elmt  Matl',
     &  '  11-stress  22-stress  33-stress  12-stress',
     &  '  23-stress  13-stress'/16x,'1-coord    2-coord','   Pressure')

2002  format(2i6,1p,6e11.3/12x,0p,2f11.5,1p,1e11.3)

3000  format(' *ERROR* Number degrees-of-freedom =',i2,' - must be 5'
     &       ' or more')

3001  format(' *ERROR* Time step size is ZERO: Set DT command')

      end subroutine flu2d4
