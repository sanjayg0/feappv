!$Id:$
      subroutine flu2d9(d,ul,xl,tl,s,r,ndf,ndm,nst,isw)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2024: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!     Modification log                                Date (dd/mm/year)
!       Original version                                    01/11/2006
!-----[--.----+----.----+----.-----------------------------------------]
!     Purpose: 2-D ALE element for FEAP (not coded)

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
      include  'eldata.h'
      include  'eltran.h'
      include  'hdata.h'
      include  'iofile.h'
      include  'prstrs.h'
      include  'qudshp.h'
      include  'comblk.h'

      integer   i,ii,j,l,nn,ndf,ndm,nst,isw,nhv,istrt
      real*8    d(*),xl(ndm,*),ul(ndf,nen,*),tl(*),s(nst,*),r(*)
      real*8    eps(9,3),dd(6,6,5), epsv(125), psig(3),epp(6),peps(3)
      real*8    ta, alam, ha

      real*8    xx(3), bmat(3,6), xc(3,125)

      save

      data      alam,ha / 2*0.0d0 /

!     Input modifications

      if(isw.eq.1) then
        return
      endif

!     Compute element tangent array

      nhv   = nint(d(15))
      istrt = nint(d(84))

!     Get quadrature information
      call quadr3d(d,.true.)

!     Set nodal coordinates to current location
      do i = 1,nel
        xc(:,i) = xl(1:3,i) + ul(1:3,i,1)
      end do ! i

!     Compute shape functions
      do l = 1,lint
        call interp3d(l, xc, ndm,nel)
      end do ! l

!     Compute the residual and tangent arrays or energy
      if(isw.eq.3 .or. isw.eq.6 .or. isw.eq.14) then

!       Compute residual and tangent arrays
        nn = 0
        do l = 1,lint

!         Compute strain at point
          call strn3d(d,xc,ul,tl,shp3(1,1,l),3,ndf,nel, eps,ta)
          epsv(l) = eps(1,1) + eps(2,1) + eps(3,1)

!         Compute stress at point

          call modlfl(l,d,ta,eps,epsv(l),hr(nh1+nn),hr(nh2+nn),
     &                nhv,istrt,dd,sigp(1,l),alam,ha,isw)

!         Residual and tangent computation

          if(isw.eq.3 .or. isw.eq.6) then

!           Form residual

            call resid3d(jac(l),shp3(1,1,l),sigp(1,l),d,xc,
     &                   ul(1,1,4),ul(1,1,5),r,ndm,ndf, .false.)

!           Stiffness computations

            if(isw.eq.3) then

!             Modify tangent for stiffness Rayleigh damping

              dd(:,:,1) = dd(:,:,1)*ctan(1)

              do j = 1,nel

!               Compute d * b matrix = a

                xx(1:3)   = shp3(1:3,j,l)*jac(l)

                bmat(1,:) = xx(1)*dd(1,:,1)
     &                    + xx(2)*dd(4,:,1)
     &                    + xx(3)*dd(6,:,1)
                bmat(2,:) = xx(1)*dd(4,:,1)
     &                    + xx(2)*dd(2,:,1)
     &                    + xx(3)*dd(5,:,1)
                bmat(3,:) = xx(1)*dd(6,:,1)
     &                    + xx(2)*dd(5,:,1)
     &                    + xx(3)*dd(3,:,1)

                do i = 1,nel

!                 Compute stiffness matrix
                  xx(1:3) = shp3(1:3,i,l)
                  do ii = 1,3
                    s(sa(i)+ii,sa(j)+1) = s(sa(i)+ii,sa(j)+1)
     &                                  + bmat(ii,1)*xx(1)
     &                                  + bmat(ii,4)*xx(2)
     &                                  + bmat(ii,6)*xx(3)
                    s(sa(i)+ii,sa(j)+2) = s(sa(i)+ii,sa(j)+2)
     &                                  + bmat(ii,4)*xx(1)
     &                                  + bmat(ii,2)*xx(2)
     &                                  + bmat(ii,5)*xx(3)
                    s(sa(i)+ii,sa(j)+3) = s(sa(i)+ii,sa(j)+3)
     &                                  + bmat(ii,6)*xx(1)
     &                                  + bmat(ii,5)*xx(2)
     &                                  + bmat(ii,3)*xx(3)
                  end do ! ii
                end do ! j
              end do ! i

            endif ! isw.eq.3 & 6

          endif ! isw.eq.3 & 6
          nn = nn + nhv
        end do ! l

!     Compute and output element variables
      elseif(isw.eq.4 .or. isw.eq.8 .or. isw.eq.16 .or. isw.eq.22) then

!       Set initial counter for history terms in stress/strain
        nn = 0
        do l = 1,lint

!         Compute strain at point
          call strn3d(d,xc,ul,tl,shp3(1,1,l),ndm,ndf,nel, eps,ta)
          epsv(l) = eps(1,1) + eps(2,1) + eps(3,1)

!         Compute stress at point
          call modlfl(l,d,ta,eps,epsv(l),hr(nh1+nn),hr(nh2+nn),
     &                nhv,istrt,dd,sigp(1,l),alam,ha,isw)

!         Output values
          if(isw.eq.4) then

!           Compute coordinates
            xx(:) = 0.0
            do j = 1,nel
              xx(:) = xx(:) + shp3(4,j,l)*xc(:,j)
            end do ! j

!           Compute principal stress values
            do i = 1,3
              epp(i  ) = eps(i  ,1)
              epp(i+3) = eps(i+3,1)*0.5d0
            end do ! i
            call pstr3d(sigp(1,l),psig)
            call pstr3d(epp      ,peps)

            mct = mct - 5
            if(mct.le.0) then
              write(iow,2010) o,head
              if(ior.lt.0) write(*,2010) o,head
              mct = 50
            endif
            write(iow,2011) n_el,ma,xx,
     &                      (sigp(i,l),i=1,6),(epp(i),i=1,6),
     &                      (psig(i),i=1,3),(peps(i),i=1,3)
            if(ior.lt.0) then
              write(*,2011) n_el,ma,xx,
     &                      (sigp(i,l),i=1,6),(epp(i),i=1,6),
     &                      (psig(i),i=1,3),(peps(i),i=1,3)
            endif

!         Save for projections
          elseif(isw.eq.8) then

            do i = 1,6
              epsp(i,l) = eps(i,1)
            end do ! i

          endif
          nn = nn + nhv
        end do ! l

!       Plot stress values
        if(isw.eq.8) then
          call slcn3d(sigp,epsp, r,s, nel)
        endif
      endif

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

      end subroutine flu2d9
