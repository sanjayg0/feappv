!$Id:$
      subroutine umacr2(lct,ctl)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2024: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!     Modification log                                Date (dd/mm/year)
!       Original version                                    01/11/2006
!       1. Remove 'prt' from argument list                  09/07/2009
!       2. Add 'uhelpfl' comment option                     19/10/2017
!       3. Add 'help' comment option - replaces 'uhelpfl'   07/01/2019
!       4. Convert allocates to USOL & JP & TANG            20/01/2019
!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Form pressure projection matrix: C^T M^-1 C = H
!               Perform sets for 3 parts of split algorithms

!      Solution commands:
!        SPLIt INIT         Form  pressure projection matrix (Donea)
!        SPLIt STEP <1,2,3> For split basic solution steps

!      Ref:   "Finite element solution of unsteady {Navier-Stokes}
!              equations by a fractional step method", by
!              J. Donea, S. Giuliani, H. Laval and L. Quartapelle,
!              Comp. Meth. Appl. Mech. & Engr., v33:53-73, 1982.
!      Inputs:
!         lct       - Command character parameters
!         ctl(3)    - Command numerical parameters

!      Outputs:
!         N.B.  Users are responsible for command actions.  See
!               programmers manual for example.
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'counts.h'
      include  'cdata.h'
      include  'fdata.h'
      include  'iofile.h'
      include  'part0.h'
      include  'print.h'
      include  'sdata.h'
      include  'umac1.h'

      include  'pointer.h'
      include  'comblk.h'

      character (len=15) :: lct

      logical       :: pcomp, s2init
      real (kind=8) :: ctl(3)

      save

!     Set command word

      if(pcomp(uct,'mac2',4)) then      ! Usual    form
        uct = 'spli'                    ! Specify 'split'
        write(*,2000)
        s2init = .true.

      elseif(pcomp(lct,'help',4)) then  ! Write help information

        write(*,'(/2x,a)') 'COMMAND: Form pressure projection matrix'

      elseif(urest.eq.1) then           ! Read  restart data

      elseif(urest.eq.2) then           ! Write restart data

      else                              ! Perform user operation

        if(pcomp(lct,'step',4)) then
          if(    nint(ctl(1)).eq.1) then
            if(fl(8)) then
              call p_split_s(mr(np(31)),hr(np(npart+12)),hr(np(26)),
     &                       prt)
              fl(8) = .false.
            endif

          elseif(nint(ctl(1)).eq.2) then
            call p_split_i(mr(np(31)),mr(np(33)),s2init)
          elseif(nint(ctl(1)).eq.3) then
            if(fl(8)) then
              call p_split_s(mr(np(31)),hr(np(npart+12)),hr(np(26)),
     &                       prt)
              fl(8) = .false.
            endif
          endif
        elseif(pcomp(lct,'init',4)) then
          call p_split_i(mr(np(31)),mr(np(33)),s2init)
        endif

      endif
2000  format('  *USER COMMAND* Command SPLIT installed')

      end subroutine umacr2

      subroutine p_split_i(eq,ix,s2init)

!     Initialize to form pressure matrix H = C^T M^{-1} C

      implicit none

      include   'debugs.h'
      include   'eldata.h'
      include   'cdata.h'
      include   'fdata.h'
      include   'iofile.h'
      include   'sdata.h'
      include   'part0.h'
      include   'part7.h'
      include   'print.h'
      include   'p_int.h'
      include   'rjoint.h'
      include   'eqsym.h'

      include   'pointer.h'
      include   'comblk.h'
      include   'split1.h'

      character (len=5) :: textp
      logical       :: setval, palloc, factor ,s2init, pelflg
      integer       :: eq(ndf,numnp,*)
      integer       :: ix(nen1,numel)

      integer       :: n
      integer       :: nd1,nd3
      integer       :: ctot
      integer       :: ittyp
      real (kind=8) :: norm

      save

!     Set up matrix for pressure projection
      if(s2init) then

!       Check if data available
        if(maxpart.lt.3) then
          write(*,*) ' Must specify 3 partitions first'
          return
        endif

!       Set location of velocity 'u' and 'u_star" in U-array
        do n = 1,maxpart
          if(ndfst(3,n).gt.0) nd3 = n
          if(ndfst(1,n).gt.0) nd1 = n
        end do ! n
        npart = nd3

        if(debug) then
          write(*,'(a,i3,a)') ' * SPLIT: NPART =',npart,' Initialize H'
          write(*,'(2x,a,i3)') 'Velocity in partition =',nd1
          write(*,'(2x,a,i3)') 'Pressure in partition =',nd3
        endif
        if(nd1.ne.1) nd1 = nd1 + 1
        if(nd3.ne.1) nd3 = nd3 + 1

!       Count number of pressure and velocity eqations
        neqp = 0
        nequ = 0
        do n = 1,numnp
          if(eq(3,n,nd3).gt.0) neqp = max(neqp,eq(3,n,nd3))
          if(eq(1,n,nd1).gt.0) nequ = max(nequ,eq(1,n,nd1))
          if(eq(2,n,nd1).gt.0) nequ = max(nequ,eq(2,n,nd1))
        end do ! n
        write(  *,'(2x,a,i9)') 'NEQP Nodal Pressure Eqs    =',neqp
!       Check for element equations for pressure
        if(np(210).ne.0) then
          call p_split_eqlp(mr(np(33)),mr(np(32)),mr(np(210)))
          pelflg = .true.
          fp(1)  = np(210)
        else
          pelflg = .false.
          fp(1)  = np(26)
        endif
        write(  *,'(2x,a,i9)') 'NEQP Pressure Equations    =',neqp
        write(  *,'(2x,a,i9)') 'NEQU Velocity Equations    =',nequ
        write(iow,'(2x,a,i9)') 'NEQP Pressure Equations    =',neqp
        write(iow,'(2x,a,i9)') 'NEQU Velocity Equations    =',nequ

!       Check rank of final pressure matrix
        if(neqp.ge.numnp) then
          write(*,*) ' ERROR: Need at least 1 B.C. on pressure'
        endif

!       Check that mesh is big enough
        if(neqp.gt.nequ) then
          write(*,*) ' ERROR: Mesh too small matrix will be singular'
        endif

!       Allocate arrays
        setval = palloc(227,'USOL3',3*neqp,1)  ! Allocate cr
        call p_split_cr(mr(np(227)),ix,eq,mr(fp(1)),pelflg,
     &                  nd1,nd3, ctot)

!       Allocate storage for mass and C array
        setval = palloc(225,'USOL1',ctot,2)       ! C array
        setval = palloc(226,'USOL2',nequ,2)       ! M array
        setval = palloc(228,'USOL4',neqp,1)       ! JP array
        setval = palloc(229,'USOL5',neqp,2)       ! P array
        textp = ' '
        write(textp,'(a2,i1)') 'JP',npart
        setval = palloc(20+npart,textp,neqp,1)    ! JP array

!       Form C & MD matrices
        call p_split_c(eq,ix,mr(np(227)), hr(np(225)),hr(np(226)),
     &                 mr(fp(1)),pelflg, ctot, nd1,nd3)

!       Determite profile of final matrix
        call p_split_j(mr(np(228)),mr(np(227)), ctot)

        textp = ' '
        write(textp,'(a4,i1)') 'TANG',npart
        setval = palloc(npart,textp,neqp+ctot,2)  ! TANG array for H
        call p_split_h(hr(np(npart)),hr(np(npart)+neqp),mr(np(228)),
     &            hr(np(225))  ,hr(np(226)) ,mr(np(227)))
        setval = palloc(230,'USOL6',neqp+ctot,2)  ! H array
        call pmove(hr(np(npart)),hr(np(230)),neqp+ctot)  ! Save H for R

!       Set pointers then factor matrix
        ittyp  = -3                  ! Profile solver
        fp(1)  = np(npart)           ! Diagonal H
        fp(2)  = np(npart)+neqp      ! Upper    H
        fp(3)  = np(npart)+neqp      ! Lower    H
        fp(4)  = np(228)             ! Column pointer
        factor = .true.
        neq  = neqp
        neqr = neqp
        neqs = neqp

        write(  *,*) ' START FACTORING: PRINT =',prnt
        write(iow,*) ' START FACTORING: PRINT =',prnt
        call psolve(ittyp,hr(np(26)),fp,factor,.false.,.false., prnt)
        write(  *,*) ' END   FACTORING'
        write(iow,*) ' END   FACTORING'

!       Activate solver
        fl(4)      = .false.
        flp(4,nd3) = .false.
        s2init     = .false.

!     Solve pressure equation
      elseif(fl(8)) then

!       Extract p_n+1 array
        call p_split_p(hr(np(229)),hr(np(213)),mr(np(210)))
!       Subtract H*p to form residual
        call promul(hr(np(230)+neqp),hr(np(230)+neqp),hr(np(230)),
     &              hr(np(229)),hr(np(26)),mr(np(228)),neqp,.false.)

        if(prt) then
          norm = 0.0d0
          do n = 0,neqp-1
            norm = norm + hr(np(26)+n)**2
          end do ! n
          write(iow,2001) npart, norm
          write(  *,2001) npart, norm
        endif

!       Set pointers then solve equations
        ittyp  = -3                  ! Profile solver
        fp(1)  = np(npart)           ! H_diag
        fp(2)  = np(npart)+neqp      ! H_upper
        fp(3)  = np(npart)+neqp      ! H_lower
        fp(4)  = np(228)             ! JP_column pointer
        factor = .false.
        neq  = neqp
        neqr = neqp
        neqs = neqp
        call psolve(ittyp,hr(np(26)),fp,factor,fl(8),.false., prnt)
        call pupdate(eq(1,1,nd3),hr(np(30)),hr(np(40)),hr(np(42)),
     &               hr(np(26)),fl(9),2)
        fl(8) = .false.
      endif

!     Format

2001  format(' * SPLIT: NPART =',i3,' Residual = ',1p,1e12.4)

      end subroutine p_split_i

      subroutine p_split_cr(cr,ix,eq,lagbc,pelflg, nd1,nd3, ctot)

      implicit   none

      include   'cdata.h'
      include   'debugs.h'
      include   'iofile.h'
      include   'eldata.h'
      include   'sdata.h'
      include   'split1.h'

      logical      :: factor, pelflg
      integer      :: nd1,nd3, ctot
      integer      :: cr(3,neqp)
      integer      :: ix(nen1,numel)
      integer      :: eq(ndf,numnp,*)
      integer      :: lagbc(ndl,numel)
      integer      :: n, i,j, ncr

      save

!     Initialize array
      cr(1,:) = nequ
      cr(2,:) = 0
      cr(3,:) = 0

      do n = 1,numel
        if(ix(nen,n).gt.0) then ! Fluid element
          ncr   = 0
          lp(:) = 0
          lu(:) = 0

!         Add element equations
          if(pelflg) then
            factor = .false.
            do i = 1,ndl
              if(lagbc(i,n).gt.0) then
                lp(i) = lagbc(i,n)
                ncr   = max(ncr,i)
                factor = .true.
              endif
            end do ! i

            if(factor) then
              do i = 1,nen
                if(ix(i,n).gt.0) then
                  do j = 1,nen
                    lu(2*j-1) = eq(1,ix(j,n),nd1)
                    lu(2*j  ) = eq(2,ix(j,n),nd1)
                  end do ! j
                endif
              end do ! i
            endif
!         Add nodal equations
          else
            factor= .true.
            do i = 1,nen
              if(ix(i,n).gt.0) then
                if(eq(3,ix(i,n),nd3).gt.0) then
                  lp(i)     = eq(3,ix(i,n),nd3)
                  if(factor) then
                    do j = 1,nen
                      lu(2*j-1) = eq(1,ix(j,n),nd1)
                      lu(2*j  ) = eq(2,ix(j,n),nd1)
                    end do ! j
                    factor = .false.
                  endif
                  ncr = max(ncr,i)
                endif
              endif
            end do ! i
          endif
!         Set CR
          do i = 1,ncr
            if(lp(i).gt.0) then
              do j = 1,2*nen
                if(lu(j).gt.0) then
                  cr(1,lp(i)) = min(cr(1,lp(i)),lu(j))
                  cr(2,lp(i)) = max(cr(2,lp(i)),lu(j))
                endif
              end do ! j
            endif
          end do ! i
        endif
      end do ! n

      if(pelflg) then
        do n = 1,neqp
          if(cr(2,n).eq.0) cr(1,n) = 0
        end do ! n
      endif

!     Compute total storage
      ctot = 0
      do n = 1,neqp
        cr(3,n) = ctot
        ctot    = ctot + cr(2,n) - cr(1,n) + 1
      end do ! n
!     Output pointers to C
      if(debug) call iprint(cr,3,neqp,3,'CR')
      write(  *,'(2x,a,i9)') 'TOTAL STORAGE FOR C        =',ctot
      write(iow,'(2x,a,i9)') 'TOTAL STORAGE FOR C        =',ctot

      end subroutine p_split_cr

      subroutine p_split_c(eq,ix,cr, c,md, lagbc,pelflg,
     &                     ctot, nd1,nd3)

      implicit   none

      include   'cdata.h'
      include   'debugs.h'
      include   'split1.h'
      include   'eldata.h'
      include   'hdatam.h'
      include   'iofile.h'
      include   'sdata.h'
      include   'pointer.h'

      logical       :: pelflg
      integer       :: ctot
      integer       :: cr(3,neqp)
      integer       :: ix(nen1,numel)
      integer       :: eq(ndf,numnp,*)
      integer       :: lagbc(ndl,numel)
      real (kind=8) :: c(ctot)
      real (kind=8) :: md(nequ)

      integer       :: n, i,j,js, nd1,nd3, ncr
      integer       :: idum(1)

      save

!     Initialize arrays
      c(:)  = 0.0d0
      md(:) = 0.0d0

!     Assemble C
      do n = 1,numel
!       Compute C
        hflgu  = .false.
        h3flgu = .false.
        call formfe( np(40), np(26), np(26), np(26),
     &              .false.,.false.,.false.,.false.,
     &               31,n,n,1)

        if(nel.eq.nen) then
!         Set assembly routines
          lp(:) = 0
          ncr   = 0
!         Add element equations
          if(pelflg) then
            if(debug .and. ndebug.gt.1) then
              write(iow,*) 'PELFLG =',pelflg,' NDL =',ndl,lagbc(1,1:2)
              call mprint(cl,ndl,2*nel,16,'CL')
            endif
            do i = 1,ndl
              if(lagbc(i,n).gt.0) then
                lp(i) = lagbc(i,n)
                ncr   = i
              endif
            end do ! i
          else
            do i = 1,nel
              if(ix(i,n).gt.0) then
                if(eq(3,ix(i,n),nd3).gt.0) then
                  lp(i)     = eq(3,ix(i,n),nd3)
                  ncr       = i
                endif
              endif
            end do ! i
          endif
          lu(:) = 0
          do i = 1,nel
            if(ix(i,n).gt.0) then
              lu(2*i-1) = eq(1,ix(i,n),nd1)
              lu(2*i  ) = eq(2,ix(i,n),nd1)
            endif
          end do ! i
          if(debug) then
            idum(1) = n
            call iprint(idum,1,1,1,'ELEMENT')
            idum(1) = ncr
            call iprint(idum,1,1,1,'NCR')
            call iprint(lp,1, ncr ,1,'LP')
            call iprint(lu,1,2*nen,1,'LU')
            call mprint(cl,ncr,2*nen,16,'CL')
            call mprint(ml,1,2*nen,1,'ML')
          endif

!         Set C
          do j = 1,2*nen
            if(lu(j).gt.0) then
              do i = 1,ncr
                if(lp(i).gt.0) then
                  js = lu(j) - cr(1,lp(i)) + 1
                  c(cr(3,lp(i))+js) = c(cr(3,lp(i))+js) + cl(i,j)
                endif
              end do ! i
              md(lu(j)) = md(lu(j)) + ml(j)
            endif
          end do ! j
        endif ! nel.eq.nen
      end do ! n

      ctot = 0
      do n = 1,cr(3,neqp)
        if(c(n).ne.0.0d0) ctot = ctot + 1
      end do ! n

!     Output MD & C array
      if(debug) then
        call mprint(md,1,nequ,1,'MD')
        write(  *,'(a)') '    Matrix C'
        write(iow,'(a)') '    Matrix C'
        do n = 1,neqp
          js = cr(3,n) - cr(1,n) + 1
          if(ior.lt.0) then
            write(*,2001) n,(c(js+i),i=cr(1,n),cr(2,n))
          endif
          write(iow,2001) n,(c(js+i),i=cr(1,n),cr(2,n))
        end do ! n
      endif

      write(  *,'(2x,a,i9)') 'TOTAL NUMBER NON-ZERO IN C =',ctot
      write(iow,'(2x,a,i9)') 'TOTAL NUMBER NON-ZERO IN C =',ctot

!     Formats

2001  format(i8,1p,6e12.4/(8x,1p,6e12.4))

      end subroutine p_split_c

      subroutine p_split_j(jp,cr, jtot)

!     Purpose: Compute column heights for profile storage and pointers

      implicit   none

      include   'debugs.h'
      include   'iofile.h'
      include   'split1.h'

      integer    :: jtot
      integer    :: jp(neqp)
      integer    :: cr(3,neqp)

      integer    :: i,is,ie, j,js,je

      save

      jp(:) = 0
      do i = 1,neqp-1    ! rows
        is = cr(1,i)
        ie = cr(2,i)
        do j = i+1,neqp  ! columns
          js = cr(1,j)
          je = cr(2,j)
          if(ie.ge.js .and. is.le.je) then
            jp(j) = max(jp(j),j-i)
          endif
        end do !j
      end do ! i
      if(debug) call iprint(jp,1,neqp,1,'JP_col')

      do i = 2,neqp
        jp(i) = jp(i-1) + jp(i)
      end do ! i
      if(debug) call iprint(jp,1,neqp,1,'JP_profile')

      jtot = jp(neqp)
      write(  *,'(2x,a,i9)') 'TOTAL STORAGE FOR H        =',jtot+neqp
      write(iow,'(2x,a,i9)') 'TOTAL STORAGE FOR H        =',jtot+neqp

      end subroutine p_split_j

      subroutine p_split_h(hd,hp,jp,c,md,cr)

!     Purpose: Compute matrix multiplies for pressure matrix H

      implicit   none

      include   'debugs.h'
      include   'split1.h'
      include   'iofile.h'

      integer                    :: cr(3,neqp)
      integer                    :: jp(neqp)
      real (kind=8)              :: hd(neqp), hp(*)
      real (kind=8)              :: md(nequ)
      real (kind=8)              :: c(*)
      real (kind=8), allocatable :: v1(:)
      real (kind=8), allocatable :: v2(:)

      integer                    :: n, i, j
      integer                    :: ih,is,ie, js,je, hs,he,hl
      integer                    :: ctot, hm
      real (kind=8)              :: dot, vv

      save

!     Allocate vectors for dot products.
      allocate ( v1(nequ) )
      allocate ( v2(nequ) )

!     Compute profile matrix
      ctot = 0
      hm   = 0
      do i = 1,neqp
        v1(:) = 0.0d0
        v2(:) = 0.0d0
        ih    = cr(3,i) - cr(1,i) + 1
        is = cr(1,i)
        ie = cr(2,i)
        do n = is,ie
          if(md(n).ne.0.0d0) then
            v1(n) = c(ih+n)/md(n)           ! x inverse of mass
            v2(n) = c(ih+n)
          endif
        end do ! j
!       Diagonal
        hd(i) = dot(v1,v2,nequ)
!       Columns
        do j = i+1,neqp
          js = cr(1,j)
          je = cr(2,j)
          hs = max(is,js)
          he = min(ie,je)
          if(he.ge.hs) then
            hl = he-hs + 1
            hl = min(hl,nequ)
            ctot = ctot + hl
            if(ctot.gt. 1000000) then
              hm   = hm + 1
              ctot = ctot - 1000000
            endif
            v2(:) = 0.0d0
            ih    = cr(3,j) - cr(1,j) + 1
            do n = js,je
              v2(n) = c(ih+n)
            end do ! j
            vv = dot(v1(hs),v2(hs),hl)
            if(vv.ne.0.0d0) then
              ih     = jp(j) - j + i + 1
              hp(ih) = hp(ih) + vv
            endif
          endif
        end do ! j
      end do ! i

      write(*,'(2x,2(a,i9),a)') 'TOTAL OPERATIONS FOR H     =',hm,
     &                          ' MEG_OPS +',ctot,' OPS'

      if(debug) then
        call mprint(hd,1,neqp,1,'HD_prof')
        call moprof(jp,hp,neqp,'HP_prof')
      endif

!     Deallocate temporary vectors
      deallocate ( v1 )
      deallocate ( v2 )

      end subroutine p_split_h

      subroutine p_split_s(eq,mass,resid,prt)

!     Purpose: Compute explicit update of velocity equations

      implicit   none

      include   'iofile.h'
      include   'cdata.h'
      include   'fdata.h'
      include   'rdata.h'
      include   'sdata.h'
      include   'tdata.h'
      include   'part0.h'
      include   'pointer.h'
      include   'comblk.h'
      include   'debugs.h'

      logical       :: prt
      integer       :: n, nd1
      integer       :: eq(ndf,numnp,*)
      real (kind=8) :: mass(neq), resid(neq), norm

      save

      if(debug) then
        call mprint(mass,1,neq,1,'MASS')
        call mprint(resid,1,neq,1,'RESID')
      endif

!     Compute norm of residual
      if(prt) then
        norm = 0.0d0
        do n = 1,neq
          norm = norm + resid(n)*resid(n)
        end do ! n
        write(iow,2001) npart, norm
        write(  *,2001) npart, norm
      endif

!     Multiply residual by 'dt' and divide by diagonal mass elements
      resid = resid * dt
      do n = 1,neq
        resid(n) = resid(n)/mass(n)
      end do ! n

!     Update velocities
      nd1 = npart
      if(npart.ne.1) nd1 = nd1 + 1
      call pupdate(eq(1,1,nd1),hr(np(30)),hr(np(40)),hr(np(42)),
     &                    resid,fl(9),2)

!     Format

2001  format(' * SPLIT: NPART =',i3,' Residual = ',1p,1e12.4)

      end subroutine p_split_s

      subroutine p_split_eqlp(ix,ie,lagbc)

      implicit   none

      include   'split1.h'
      include   'cdata.h'
      include   'cdat1.h'
      include   'sdata.h'
      include   'part0.h'

      integer       :: n, i, dof, ma
      integer       :: ix(nen1,numel), ie(nie,*),  lagbc(ndl,numel)

      save

      do n = 1,numel
        ma = ix(nen1,n)
        if(ma.gt.0) then
          if(ix(nen,n).gt.0) then
            dof = ie(nie-8,ma)
            if(dof.gt.0 .and. ie(nie-9,ma).eq.npart) then
              do i = 1,dof
                if(lagbc(i,n).gt.0) then
                  neqp = neqp + 1
                endif
              end do ! i
            endif
          else
            do i = 1,dof
              lagbc(i,n) = 0
            end do ! i
          endif ! Fluid elements
        endif
      end do ! n

      end subroutine p_split_eqlp

      subroutine p_split_p(pr,ulagr,lagbc)

!     Extract current pressure for completion of residual

      implicit  none

      include  'cdata.h'
      include  'sdata.h'
      include  'split1.h'

      integer       :: lagbc(ndl,numel)
      real (kind=8) :: ulagr(ndl,3,numel)
      real (kind=8) :: pr(neqp)

      integer       :: n,i

      save

      pr(:) = 0.0d0
      do n = 1,numel
        do i = 1,ndl
          if(lagbc(i,n).gt.0) then
            pr(lagbc(i,n)) = ulagr(i,1,n)
          endif
        end do ! i
      end do ! n

      end subroutine p_split_p
