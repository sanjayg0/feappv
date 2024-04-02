!$Id:$
      subroutine flu3d1(d,ul,xl,tl,s,r,ndf,ndm,nst,isw)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2024: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!     Modification log                                Date (dd/mm/year)
!       Original version                                    01/11/2006
!-----[--.----+----.----+----.-----------------------------------------]
!     Purpose: 3-D incompressible Navier-Stokes element for FEAP
!              Velocity: QmPn formulation for hexagonal elements

!     Inputs:
!       d(*)           - Material parameters
!       ul(ndf,nen,*)  - Solution parameters
!       xl(ndm,nen)    - Nodal element coordinates
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

      integer       :: i,ii,j,l,nn,ndf,ndm,nst,isw,nhv,istrt
      real (kind=8) :: uu(3,125), gradv(3,3,125),conv(3),eps(9,3)
      real (kind=8) :: d(*),xl(ndm,*),ul(ndf,nen,*),tl(*),s(nst,*),r(*)
      real (kind=8) :: epsv(125), aa(6,6,5,125), bcon(3,3),dd(6,6)
      real (kind=8) :: epp(6),psig(3),peps(3), x0(3), xx(3), bmat(3,6)
      real (kind=8) :: ta, lfac, cfac, alam, ha, rhoj, diagu

      save

      data      alam,ha / 2*0.0d0 /

!     Input modifications
      if(isw.eq.1) then
        d(170) = 5.0d0    ! Force incompressible NS
        if(nen.le.8) then
          nlm = 1         ! Element pressure variables for H8
        elseif(nen.le.27) then
          nlm    = 4      ! Element pressure variables for H27
        else
          nlm    = 10     ! Element pressure variables for H64
        endif
        return
      endif

!     Compute element tangent array
      nhv   = nint(d(15))
      istrt = nint(d(84))

!     Get quadrature information
      call quadr3d(d,.true.)

!     Compute shape functions
      do l = 1,lint
        call interp3d(l, xl, ndm,nel)
      end do ! l

!     Center estimate
      if(npm.gt.1) then
        x0(1:3) = 0.0d0
        do j = 1,nvn
          x0(1:3) = x0(1:3) + xl(1:3,j)
        end do ! j
        x0(1:3) = x0(1:3)/dble(nvn)
      endif

!     Set pressure functions
      do l = 1,lint
        xx(:) = 0.0d0
        do i = 1,nel
          xx(:) = xx(:) + xl(1:3,i)*shp3(4,i,l)
        end do ! i
        phi(1,l) = 1.d0
        if(npm.gt.1) then
          phi(2:4,l) = xx(1:3) - x0(1:3)
          if(npm.gt.4) then
            phi( 5,l) = phi(2,l)**2
            phi( 6,l) = phi(2,l)*phi(3,l)
            phi( 7,l) = phi(3,l)**2
            phi( 6,l) = phi(3,l)*phi(4,l)
            phi( 9,l) = phi(4,l)**2
            phi(10,l) = phi(4,l)*phi(2,l)
          endif
        endif
!       Compute pressure
        press(l) = 0.0
        do i = 1,npm
          press(l) = press(l) + ule(i,1)*phi(i,l)
        end do ! i
      end do ! l

!     Compute the residual and tangent arrays or outputs
      if(isw.eq.3 .or. isw.eq.6 .or.
     &   isw.eq.4 .or. isw.eq.8 .or. isw.eq.22) then

!       Compute strain-rate & stress values
        nn = 0
        do l = 1,lint

!         Compute strain at point
          call strnr3d(d,xl,ul,tl,shp3(1,1,l),ndm,ndf,nel,
     &                 uu(1,l),gradv(1,1,l),eps,ta)

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

!         Loop over quadrature points
          do l = 1,lint

!           Store time history plot data for element
            i = 6*(l-1)
            do j = 1,3
              tt(j+i) = sigp(j,l) + press(l)
            end do ! j
            do j = 4,6
              tt(j+i) = sigp(j,l)
            end do ! j

!           Append pressure to deviator stress
            sigp(1,l) = sigp(1,l) + press(l)

!           Form residual
            call resid3d(jac(l),shp3(1,1,l),sigp(1,l),d,
     &                   ul(1,1,4),ul(1,1,4),r,ndf,l)

!           Convective term
            rhoj    = d(4)*jac(l)
            conv(:) = gradv(:,1,l)*uu(1,l)
     &              + gradv(:,2,l)*uu(2,l)
     &              + gradv(:,3,l)*uu(3,l)

!           Convective residual
            do i = 1,nel
              r(sa(i)+1) = r(sa(i)+1) - rhoj*shp3(4,i,l)*conv(1)
              r(sa(i)+2) = r(sa(i)+2) - rhoj*shp3(4,i,l)*conv(2)
              r(sa(i)+3) = r(sa(i)+3) - rhoj*shp3(4,i,l)*conv(3)
            end do ! i

!           Continutity constraint
            do i = 1,npm
              r(ga+i) = r(ga+i) - phi(i,l)*epsv(l)*jac(l)
            end do ! i

!           Stiffness computations
            if(isw.eq.3) then

!             Modify tangent for jacobian & transient factor
              dd(:,:) = aa(:,:,1,l)*jac(l)*ctan(1)
              rhoj    = rhoj*ctan(1)

              do j = 1,nel

!               Compute D * B  * j
                bmat(1,:) = dd(1,:)*shp3(1,j,l)
     &                    + dd(4,:)*shp3(2,j,l)
     &                    + dd(6,:)*shp3(3,j,l)
                bmat(2,:) = dd(4,:)*shp3(1,j,l)
     &                    + dd(2,:)*shp3(2,j,l)
     &                    + dd(5,:)*shp3(3,j,l)
                bmat(3,:) = dd(6,:)*shp3(1,j,l)
     &                    + dd(5,:)*shp3(2,j,l)
     &                    + dd(3,:)*shp3(3,j,l)

                bcon(:,:) = gradv(:,:,l)*shp3(4,j,l)
                diagu = uu(1,l)*shp3(1,j,l)
     &                + uu(2,l)*shp3(2,j,l)
     &                + uu(3,l)*shp3(3,j,l)
                bcon(1,1) = bcon(1,1) + diagu
                bcon(2,2) = bcon(2,2) + diagu
                bcon(3,3) = bcon(3,3) + diagu

!               Compute tangent matrix
                do i = 1,nel
                  do ii = 1,3
                    s(sa(i)+ii,sa(j)+1) = s(sa(i)+ii,sa(j)+1)
     &                                  + shp3(1,i,l)*bmat(ii,1)
     &                                  + shp3(2,i,l)*bmat(ii,4)
     &                                  + shp3(3,i,l)*bmat(ii,6)
     &                                  + shp3(4,i,l)*bcon(ii,1)*rhoj
                    s(sa(i)+ii,sa(j)+2) = s(sa(i)+ii,sa(j)+2)
     &                                  + shp3(1,i,l)*bmat(ii,4)
     &                                  + shp3(2,i,l)*bmat(ii,2)
     &                                  + shp3(3,i,l)*bmat(ii,5)
     &                                  + shp3(4,i,l)*bcon(ii,2)*rhoj
                    s(sa(i)+ii,sa(j)+3) = s(sa(i)+ii,sa(j)+3)
     &                                  + shp3(1,i,l)*bmat(ii,6)
     &                                  + shp3(2,i,l)*bmat(ii,5)
     &                                  + shp3(3,i,l)*bmat(ii,3)
     &                                  + shp3(4,i,l)*bcon(ii,3)*rhoj
                  end do ! ii
                end do ! j
              end do ! i

!             Add incompressible tangent
              call incom(phi(1,l),shp3(1,1,l),jac(l), s)

            endif ! isw = 3 or 6

          end do ! l

          if(debug) then
!           call mprint(s,nst,nst,nst,'S_FLD3d1')
            call mprint(r,ndf,nel,ndf,'R_FLD3d1')
            call mprint(r(sa(nen)+1),1,npm,1,'R_PRE')
          endif

!         Compute intertial effects
          if(ctan(3).ne.0.0) then
!           call iner3d(d,xl,ul(1,1,4),ul(1,1,4),s,r,
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
                xx(1:3) = xx(1:3) + shp3(4,j,l)*xl(1:3,j)
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
              write(iow,2011) n_el,ma,xx,
     &                        sigp(1:6,l),epsp(1:6,l),psig(:),peps(:)
              if(ior.lt.0) then
                write(*,2011) n_el,ma,xx,
     &                        sigp(1:6,l),epsp(1:6,l),psig(:),peps(:)
              endif
            endif

          end do ! l

!         Plot stress values
          if(isw.eq.8) then
            call slcn3d(sigp, r,s, nel, 10)
          endif
        endif ! isw 4 , 8 , 22
      endif ! isw tests

!     Formats

2010  format(a1,20a4//5x,'Element Stresses'//'     Elmt Mat',
     &   '    1-Coord    2-Coord    3-Coord'/13x,
     &   '  11-Stress  22-Stress  33-Stress  12-Stress',
     &   '  23-Stress  31-Stress'/13x,
     &   '  11-Strain  22-Strain  33-Strain  12-Strain',
     &   '  23-Strain  31-Strain'/13x,
     &   '   1-Stress   2-Stress   3-Stress',
     &   '   1-Strain   2-Strain   3-Strain',/39(' -'))

2011  format(/i9,i4,1p,3e11.3/(13x,1p,6e11.3))

      end subroutine flu3d1
