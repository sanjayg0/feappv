!$Id:$
      subroutine flu2d1(d,ul,xl,ix,tl,s,r,ndf,ndm,nst,isw)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2024: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!     Modification log                                Date (dd/mm/year)
!       Original version                                    01/11/2006
!-----[--.----+----.----+----.-----------------------------------------]
!     Purpose: 2-D incompressible Navier-Stokes element for FEAP
!              Formulation: Qn/Pm where m = n-1

!     Note: Pm values stored as element equations (nlm = number)

!     Inputs:
!       d(*)           - Material parameters
!       ul(ndf,nen,*)  - Solution parameters
!       xl(ndm,nen)    - Nodal element coordinates
!       ix(*)          - Nodal connection for element
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
      include  'comblk.h'

      integer       :: i,ii,j,l,nn,ndf,ndm,nst,isw,nhv,istrt, ix(*)
      real (kind=8) :: uu(3,3,125), gradv(3,3,3,125),conv(3),eps(9,3)
      real (kind=8) :: d(*),xl(ndm,*),ul(ndf,nen,*),tl(*),s(nst,*),r(*)
      real (kind=8) :: epsv(125), aa(6,6,5,125), bcon(3,3),dd(6,6),bf(3)
      real (kind=8) :: epp(6),psig(3),peps(3), x0(3), xx(3), bmat(3,6)
      real (kind=8) :: ta, lfac, cfac, alam, ha, rhoj, diagu

      save

      data      alam,ha / 2*0.0d0 /

!     Input modifications for element Lagrange multipliers
      if(isw.eq.1) then
        d(170) = 5.0d0     ! Force incompressible NS
        if(nen.le.4) then
          nlm = 1          ! Element pressure variables for Q4
        elseif(nen.le.9) then
          nlm = 3          ! Element pressure variables for Q9
        endif

!       Check for streamlines
        if(nint(d(31)).gt.0) then
          ix(4:ndf) = 0
        else
          ix(3:ndf) = 0
        endif
        call iprint(ix,1,ndf,1,'IX_DOF_MAP')
        return
      endif

!     Compute element tangent array
      nhv   = nint(d(15))
      istrt = nint(d(84))

!     Get quadrature information
      call quadr2d(d,.true.)

!     Compute shape functions
      do l = 1,lint
        call interp2d(l, xl, ix, ndm,nel, .false.)
      end do ! l

!     Center estimate
      if(npm.gt.1) then
        x0(1:2) = 0.0d0
        do j = 1,nvn
          x0(1:2) = x0(1:2) + xl(1:2,j)
        end do ! j
        x0(1:2) = x0(1:2)/dble(nvn)
      endif

!     Set pressure functions
      do l = 1,lint
        xx(:) = 0.0d0
        do i = 1,nel
          xx(1:2) = xx(1:2) + xl(1:2,i)*shp2(3,i,l)
        end do ! i
        phi(1,l) = 1.d0
        if(npm.gt.1) then
          phi(2:3,l) = xx(1:2) - x0(1:2)
        endif
!       Compute pressure
        press(l) = ule(1,1)
        do i = 2,npm
          press(l) = press(l) + ule(i,1)*phi(i,l)
        end do ! i
      end do ! l

!     Compute the residual and tangent arrays or outputs
      if(isw.eq.3 .or. isw.eq.6 .or. isw.eq.4 .or. isw.eq.8) then

!       Compute strain-rate & stress values
        nn = 0
        do l = 1,lint

!         Compute strain at point
          call strnr2d(d,xl,ul,tl,shp2(1,1,l),ndm,ndf,nel,
     &                 uu(1,1,l),gradv(1,1,1,l),eps,ta)

!         Convert strain rates to deviatoric form
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

!         Loop over quadrature points
          do l = 1,lint

!           Add pressure to volumetric part
!           sigp(1:3,l) = sigp(1:3,l) + press(l)

!           Store time history plot data for element
            i = 6*(l-1)
            do j = 1,6
              tt(j+i) = sigp(j,l) + press(l)
            end do ! j

!           Convective term (includes volume)
            rhoj    = d(4)*jac(l)
            conv(:) = (gradv(:,1,1,l)*uu(1,1,l)
     &              +  gradv(:,2,1,l)*uu(2,1,l))*rhoj

!           Stress term times jacobian and quadrature weight
            sigp(1:4,l) = sigp(1:4,l)*jac(l)

!           Form residual
            do i = 1,nel
              r(sa(i)+1) = r(sa(i)+1) + bf(1)*shp2(3,i,l)*jac(l)
     &                                - shp2(1,i,l)*sigp(1,l)
     &                                - shp2(2,i,l)*sigp(4,l)
     &                                - shp2(3,i,l)*conv(1)
              r(sa(i)+2) = r(sa(i)+2) + bf(2)*shp2(3,i,l)*jac(l)
     &                                - shp2(1,i,l)*sigp(4,l)
     &                                - shp2(2,i,l)*sigp(2,l)
     &                                - shp2(3,i,l)*conv(2)
            end do ! i

!           Stiffness computations
            if(isw.eq.3) then

!             Modify tangent for jacobian & transient factor
              dd(:,:) = aa(:,:,1,l)*jac(l)*ctan(1)
              rhoj    = rhoj*ctan(1)

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

!               Compute tangent matrix
                do i = 1,nel
                  do ii = 1,2
                    s(sa(i)+1,sa(j)+ii) = s(sa(i)+1,sa(j)+ii)
     &                                  + shp2(1,i,l)*bmat(ii,1)
     &                                  + shp2(2,i,l)*bmat(ii,4)
     &                                  + shp2(3,i,l)*bcon(1,ii)

                    s(sa(i)+2,sa(j)+ii) = s(sa(i)+2,sa(j)+ii)
     &                                  + shp2(1,i,l)*bmat(ii,4)
     &                                  + shp2(2,i,l)*bmat(ii,2)
     &                                  + shp2(3,i,l)*bcon(2,ii)
                  end do ! ii
                end do ! j
              end do ! i

!             Add continutity tangent & residual
              call incom2d(phi(1,l),shp2(1,1,l),jac(l),
     &                     press(l),epsv(l), s,r)

            endif ! isw = 3 or 6

          end do ! l

          if(debug) then
            call mprint(s,nst,nst,nst,'S_FLU2d1')
            call mprint(r,ndf,nel,ndf,'R_FLU2d1')
            call mprint(r(sa(nen)+1),1,npm,1,'R_PRE')
          endif

!         Compute intertial effects
          if(ctan(3).ne.0.0) then
!           call iner2d(d,xl,ix,ul(1,1,4),ul(1,1,4),s,r,
!    &                  nel,ndf,ndm,nst, isw)
          endif

!       Compute and output element variables

        elseif(isw.eq.4 .or. isw.eq.8 .or. isw.eq.22) then

!         Set initial counter for history terms in stress/strain
          do l = 1,lint

!           Add pressure to deviatoric stress
            sigp(1:3,l) = sigp(1:3,l) + press(l)

!           Output values
            if(isw.eq.4) then

!             Compute coordinates
              xx(1:3) = 0.0
              do j = 1,nel
                xx(1:2) = xx(1:2) + shp2(3,j,l)*xl(1:2,j)
              end do ! j

!             Compute principal stress and strain rate values
              epp(1:3) = epsp(1:3,l)
              epp(4:6) = epsp(4:6,l)*0.5d0
              call pstr3d(sigp(1,l),psig)
              call pstr3d(epp      ,peps)

              mct = mct - 5
              if(mct.le.0) then
                write(iow,2010) o,head
                if(ior.lt.0) write(*,2010) o,head
                mct = 50
              endif
              write(iow,2011) n_el,ma,xx,press(l),
     &                        sigp(1:6,l),epsp(1:6,l),psig(:),peps(:)
              if(ior.lt.0) then
                write(*,2011) n_el,ma,xx,press(l),
     &                        sigp(1:6,l),epsp(1:6,l),psig(:),peps(:)
              endif
            endif

          end do ! l

!         Plot stress values
          if(isw.eq.8) then
!           call slcn2d(ix,sigp,epsp, r,s,r(nen+1), nel,10)
            call flcn2d(sigp,press,epsv,r,s,nel,10)
          endif
        endif ! isw 4 , 8 , 22
      endif ! isw tests

!     Formats

2010  format(a1,20a4//5x,'Element Stresses'//'     Elmt Mat',
     &   '    1-Coord    2-Coord    3-Coord   Pressure'/13x,
     &   '  11-Stress  22-Stress  33-Stress  12-Stress',
     &   '  23-Stress  31-Stress'/13x,
     &   '  11-Strain  22-Strain  33-Strain  12-Strain',
     &   '  23-Strain  31-Strain'/13x,
     &   '   1-Stress   2-Stress   3-Stress',
     &   '   1-Strain   2-Strain   3-Strain',/39(' -'))

2011  format(/i9,i4,1p,4e11.3/(13x,1p,6e11.3))

      end subroutine flu2d1
