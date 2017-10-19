!$Id:$
      subroutine slcn1d(sig,eps,shp,xsj,ix,dt,st,lint,nel,nes)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2017: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Project element variables to nodes

!      Inputs:
!        sig(nes,*) - Stresses at quadrature points
!        eps(3,*)   - Strains  at quadrature points
!        shp(2,8,*) - Shape functions at quadrature points
!        xsj(*)     - Volume element at quadrature points
!        ix(*)      - Element connection
!        lint       - Number of quadrature points
!        nel        - Number nodes on element
!        nes        - Dimension of stress array

!      Outputs:
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'cdata.h'
!     include  'sdata.h'
!     include  'prstrs.h'
      include  'strnum.h'

      integer   nel,nes, i,l,ll,lint, ix(*)
      real*8    dt(numnp),st(numnp,*),xsj(*) ,sig(nes,*),eps(3,*)
      real*8    shp(2,20,*), xg

      save

!     Lumped and consistent projection routine

      do l = 1,lint

!       Compute lumped projection and assemble stress integrals

        do i = 1,nel

          xg     = shp(2,i,l)*xsj(l)
          ll     = ix(i)
          dt(ll) = dt(ll) + xg

!         Stress projections

          st(ll,1) = st(ll,1) + sig(1,l)*xg
          st(ll,2) = st(ll,2) + sig(2,l)*xg
          st(ll,3) = st(ll,3) + sig(3,l)*xg

!         Strain projections

          st(ll,4) = st(ll,4) + eps(1,l)*xg
          st(ll,5) = st(ll,5) + eps(2,l)*xg
          st(ll,6) = st(ll,6) + eps(3,l)*xg

        end do ! i
      end do ! l

      end
