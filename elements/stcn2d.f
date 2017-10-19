!$Id:$
      subroutine stcn2d(ix,sig,shp,xsj,dt,st,ser,erav,
     &                  lint,nel,nen,numnp)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2017: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose:

!      Inputs:

!      Outputs:
!-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      integer   nel,nen,numnp
      integer   i,l,ll,lint
      real*8    xg, erav

      integer   ix(*)
      real*8    dt(numnp),st(numnp,*),ser(*)
      real*8    xsj(*),shp(3,64,*),sig(nen,*)

      save

!     Lumped and consistent projection routine

      do l = 1,lint

!       Compute lumped projection and assemble stress integrals

        do i = 1,nel
          ll = ix(i)
          if(ll.gt.0) then

            xg     = shp(3,i,l)*xsj(l)
            dt(ll) = dt(ll) + xg

!           Stress projections

            st(ll,1) = st(ll,1) + sig(1,l)*xg
            st(ll,2) = st(ll,2) + sig(2,l)*xg
            st(ll,3) = st(ll,3) + sig(3,l)*xg
            st(ll,4) = st(ll,4) + sig(4,l)*xg

!           Error estimation projection

            ser(ll)  = ser(ll)  + erav*xg

          endif
        end do
      end do

      end
