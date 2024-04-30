!$Id:$
      subroutine flu2d3(d,ul,xl,ix,tl,s,r,ndf,ndm,nst,isw)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2024: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!     Modification log                                Date (dd/mm/year)
!       Original version                                    15/01/2019
!-----[--.----+----.----+----.-----------------------------------------]
!     Purpose: 2-D incompressible Navier-Stokes element for FEAP
!              Mixed u(2)-p formulation with nodal pressures
!              Taylor-Hood formulation

!     Note:    Quadratic velocity and linear pressure treatment.

!     Ref: 1) "Navier-Stokes equations using mixed interpolation", by
!              P. Hood and C. Taylor, in Finite Element Methodsl in Flow
!              Problems, J.T. Oden, R.H. Gallagher, O.C. Zienkiewicz,
!              and C. Taylor eds., Huntsville, Alabama, 121-132, 1974.

!          2) "Implementation of Finite Element-Based Navier-Stokes
!              Solver: 2.094 -- Project", by Per-Olof Persson, 2002.

!     Inputs:
!       d(*)           - Material parameters
!       ul(ndf,nen,*)  - Solution parameters
!       xl(ndm,nen)    - Nodal element coordinates
!       ix(*)          - Nodal connection array
!       tl(nen)        - Nodal temperatures
!       ndf            - Maxiumum dofs/node (3 or more)
!       ndm            - Mesh spatial dimension (3)
!       nst            - Element matrix dimension
!       isw            - Solution operation parameter

!     Outputs:
!       s(nst,nst)     - Element matrix array
!       p(nst)         - Element vector array
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'bdata.h'
      include  'cdata.h'
      include  'debugs.h'
      include  'elcoor.h'
      include  'eldata.h'
      include  'elplot.h'
      include  'eltran.h'
      include  'hdata.h'
      include  'iofile.h'
      include  'lmdata.h'
      include  'pconstant.h'
      include  'qudshp.h'
      include  'rdata.h'
      include  'strnum.h'
      include  'pointer.h'
      include  'comblk.h'

      integer       :: i,ii,j,l,nn,ndf,ndm,nst,isw,nhv,istrt,nev
      integer       :: ix(ndf,*)
      real (kind=8) :: uu(3,3,125), gradv(3,3,3,125),conv(3),eps(9,3)
      real (kind=8) :: d(*),xl(ndm,*),ul(ndf,nen,*),tl(*),s(nst,*),r(*)
      real (kind=8) :: epsv(125), aa(6,6,5,125), bcon(3,3),dd(6,6)
      real (kind=8) :: psig(3), xx(3), bmat(3,6), bf(3)
      real (kind=8) :: ta, lfac, cfac, alam, ha, rhoj, diagu

      save

      data      alam,ha / 2*0.0d0 /

!     Input modifications

      if(isw.eq.1) then
        d(170) = 5.0d0  ! Force incompressible NS
        if(ndf.lt.3) then
          write(*,'(a,i3,a)')' --> ERROR: FLU2D3 - ndf =',ndf,
     &               ' must be 3 or more.'
          call plstop(.true.)
        endif

!       Quadratic Triangle
        if(nen.le.7) then
          ii = 4
!       Quadratic quadrilateral
        elseif(nen.le.9) then
          ii = 5
        endif

!       Check for streamlines
        if(nint(d(31)).gt.0) then
          nn = 4
        else
          nn = 3
        endif

!       Activate all dofs
        do j = 1,nen
          do i = 1,nn
            ix(i,j+1) = i
          end do ! i
          do i = nn+1,ndf
            ix(i,j+1) = 0
          end do ! i
        end do  ! j

!       Mid-edge and center node: Deactivate pressure dof
        do j = ii,min(nen,9)
          ix(3,j+1) = 0
        end do  ! j

!       Any additional nodes have no equations
        do j = 10,nen
          do i = 1,ndf
            ix(i,j+1) = 0
          end do ! i
        end do ! j
        call iprint(ix(1,2),ndf,nen,ndf,'IX_DOF_MAP')

!       Force pressure to Lagrange multiplier
        ndfl(3) = 3
        lagrfl  = .true.

!       Nodal projection values
        istv = max(istv,8)

        return
      endif

!     Compute element tangent array
      nhv   = nint(d(15))
      istrt = nint(d(84))

!     Get quadrature information
      call quadr2d(d,.true.)

!     Initialize all possible shpm
      shpm(1:nel,1:lint) = 0.0d0

!     Compute shape functions
      do l = 1,lint
        call interp2d(l, xl, ix, ndm,nel, .false.)

!       Pressure shape functions
        if(nel.eq.6) then
          shpm(1:3,l) = el2(1:3,l)
          nev         = 3
        elseif(nel.eq.8 .or. nel.eq.9) then
          shpm(1,l) = 0.25*(1.0d0 - sg2(1,l))*(1.0d0 - sg2(2,l))
          shpm(2,l) = 0.25*(1.0d0 + sg2(1,l))*(1.0d0 - sg2(2,l))
          shpm(3,l) = 0.25*(1.0d0 + sg2(1,l))*(1.0d0 + sg2(2,l))
          shpm(4,l) = 0.25*(1.0d0 - sg2(1,l))*(1.0d0 + sg2(2,l))
          nev       = 4
        endif

!       Compute pressure
        press(l) = 0.0
        do i = 1,nev
          press(l) = press(l) + ul(3,i,1)*shpm(i,l)
        end do ! i
      end do ! l

!     Compute the residual and tangent arrays or outputs
      if(isw.eq.3 .or. isw.eq.6 .or.
     &   isw.eq.4 .or. isw.eq.8 .or. isw.eq.22) then

!       Compute strain-rate & stress values
        nn = 0
        do l = 1,lint

!         Compute strain at point
          call strnr2d(d,xl,ul,tl,shp2(1,1,l),ndm,ndf,nel,
     &                 uu(1,1,l),gradv(1,1,1,l),eps,ta)

!         Convert strain ratess to deviatoric form
          epsv(l)   = eps(1,1) + eps(2,1) + eps(3,1)
          epsp(:,l) = eps(1:6,1)

!         Compute stress at point
          call modlfl(l,d,ta,eps,epsv(l),hr(nh1+nn),hr(nh2+nn),
     &                nhv,istrt,aa(1,1,1,l),sigp(1,l),alam,ha,isw)

          nn = nn + nhv
        end do ! l

!       Residual and tangent computation
        if(isw.eq.3 .or. isw.eq.6) then

!         Compute intertial effects
          if(ctan(3).ne.0.0) then
            cfac = d(7)
            lfac = 1.0d0 - cfac
          else
            cfac = 0.0d0
            lfac = 0.0d0
          endif

          bf(:) = 0.0d0

!         Loop over quadrature points
          do l = 1,lint

!           Add pressure to deviator stress
            sigp(1:3,l) = sigp(1:3,l) - press(l)

!           Store time history plot data for element
            i = 6*(l-1)
            do j = 1,6
              tt(j+i) = sigp(j,l)
            end do ! j

!           Convective term
            rhoj      = d(4)*jac(l)
            sigp(:,l) = sigp(:,l)*jac(l)
            conv(:)   = (gradv(:,1,1,l)*uu(1,1,l)
     &                +  gradv(:,2,1,l)*uu(2,1,l))*rhoj

!           Form residual
            do i = 1,nel
!             Velocity residual
              r(sa(i)+1) = r(sa(i)+1) + bf(1)*shp2(3,i,l)*jac(l)
     &                                - shp2(1,i,l)*sigp(1,l)
     &                                - shp2(2,i,l)*sigp(4,l)
     &                                - shp2(3,i,l)*conv(1)

              r(sa(i)+2) = r(sa(i)+2) + bf(2)*shp2(3,i,l)*jac(l)
     &                                - shp2(1,i,l)*sigp(4,l)
     &                                - shp2(2,i,l)*sigp(2,l)
     &                                - shp2(3,i,l)*conv(2)
            end do ! i

!           Pressure residual
            do i = 1,nev
              r(sa(i)+3) = r(sa(i)+3) + epsv(l)*shpm(i,l)*jac(l)
            end do ! i

!           Stiffness computations
            if(isw.eq.3) then

!             Modify tangent for jacobian
              dd(:,:) = aa(:,:,1,l)*jac(l)*ctan(1)

              do j = 1,nel

!               Compute D * B * j
                bmat(1,:) = dd(1,:)*shp2(1,j,l) + dd(4,:)*shp2(2,j,l)
                bmat(2,:) = dd(4,:)*shp2(1,j,l) + dd(2,:)*shp2(2,j,l)

!               Advection tangent
                bcon(:,:) = gradv(:,:,1,l)*shp2(3,j,l)
                diagu     = uu(1,1,l)*shp2(1,j,l)+uu(2,1,l)*shp2(2,j,l)
                bcon(1,1) = bcon(1,1) + diagu
                bcon(2,2) = bcon(2,2) + diagu
                bcon(:,:) = bcon(:,:)*rhoj

!               Compute stiffness matrix
                do i = 1,nel
                  do ii = 1,2
!                   Material and convection tangent
                    s(sa(i)+1,sa(j)+ii) = s(sa(i)+1,sa(j)+ii)
     &                                  + shp2(1,i,l)*bmat(ii,1)
     &                                  + shp2(2,i,l)*bmat(ii,4)
     &                                  + shp2(3,i,l)*bcon(1,ii)

                    s(sa(i)+2,sa(j)+ii) = s(sa(i)+2,sa(j)+ii)
     &                                  + shp2(1,i,l)*bmat(ii,4)
     &                                  + shp2(2,i,l)*bmat(ii,2)
     &                                  + shp2(3,i,l)*bcon(2,ii)

!                   Continuity tangent
                    s(sa(i)+ii,sa(j)+3) = s(sa(i)+ii,sa(j)+3)
     &                                  - shp2(ii,i,l)*shpm(j,l)*jac(l)
                    s(sa(j)+3,sa(i)+ii) = s(sa(j)+3,sa(i)+ii)
     &                                  - shp2(ii,i,l)*shpm(j,l)*jac(l)
                  end do ! ii
                end do ! j
              end do ! i

            endif ! isw = 3 or 6

          end do ! l

          if(debug) then
            call mprint(s,nst,nst,nst,'S_FLD2d3')
            call mprint(r,ndf,nel,ndf,'R_FLD2d3')
          endif

!         Compute intertial effects
          if(ctan(3).ne.0.0) then
!           call iner2d(d,xl,ix,ul(1,1,4),ul(1,1,4),s,r,
!    &                  nel,ndf,ndm,nst, isw)
          endif

!       Compute and output element variables
        elseif(isw.eq.4 .or. isw.eq.8) then

!         Set initial counter for history terms in stress/strain
          do l = 1,lint

!           Output values
            if(isw.eq.4) then

!             Compute coordinates
              xx(1:3) = 0.0
              do j = 1,nel
                xx(1:2) = xx(1:2) + shp2(3,j,l)*xl(1:2,j)
              end do ! j

!             Compute principal stress values
              call pstr3d(sigp(1,l),psig)

              mct = mct - 5
              if(mct.le.0) then
                write(iow,2010) o,head
                if(ior.lt.0) write(*,2010) o,head
                mct = 50
              endif
              write(iow,2011) n_el,ma,xx,
     &                        sigp(1:6,l),psig(:),press(l)
              if(ior.lt.0) then
                write(*,2011) n_el,ma,xx,
     &                        sigp(1:6,l),psig(:),press(l)
              endif
            endif

          end do ! l

!         Plot stress values
          if(isw.eq.8) then
            call flcn2d(sigp,press,epsv, r,s, nel,10)
          endif
        endif ! isw 4 , 8 , 22
      endif ! isw tests

!     Formats

2010  format(a1,20a4//5x,'Element Viscous Stresses & Pressure'//
     &   '     Elmt Mat    1-Coord    2-Coord    3-Coord'/13x,
     &   '  11-Stress  22-Stress  33-Stress  12-Stress',
     &   '  23-Stress  31-Stress'/13x,
     &   '   1-Stress   2-Stress   3-Stress   Pressure'/39(' -'))

2011  format(/i9,i4,1p,3e11.3/(13x,1p,6e11.3))

      end subroutine flu2d3
