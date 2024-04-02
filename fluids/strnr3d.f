!$Id:$
      subroutine strnr3d(d,xl,ul,th,shp,ndm,ndf,nel, uu, gradv, eps,ta)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2024: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!     Modification log                                Date (dd/mm/year)
!       Original version                                    08/04/2018
!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Three dimensional strain rate calculations

!      Inputs:

!      Outputs:
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'cdata.h'
      include  'elcoor.h'
      include  'elpers.h'

      integer   ndm,ndf,nel, a,i
      real*8    d(*),xl(ndm,*),ul(ndf,nen,*),th(*),shp(4,*)
      real*8    uu(3), gradv(3,3),eps(9,3), ta

      save

!     Compute strain rate at point

      xref(1:3)  = 0.0d0
      gradv(:,:) = 0.0d0
      uu(1:3)    = 0.0d0

!     Compute temperature, coordinate, velocity and gradient
      ta = -d(9)
      do a = 1,nel
        ta        = ta        + shp(4,a)*th(a)
        xref(1:3) = xref(1:3) + shp(4,a)*xl(1:3,a)
        uu(1:3)   = uu(1:3)   + shp(4,a)*ul(1:3,a,1)
        do i = 1,3
          gradv(1:3,i) = gradv(1:3,i) + ul(1:3,a,1)*shp(i,a)
        end do ! i
        eps(1,3) = eps(1,3) + shp(1,a)*ul(1,a,2)
        eps(2,3) = eps(2,3) + shp(2,a)*ul(2,a,2)
        eps(3,3) = eps(3,3) + shp(3,a)*ul(3,a,2)
        eps(4,3) = eps(4,3) + shp(1,a)*ul(2,a,2) + shp(2,a)*ul(1,a,2)
        eps(5,3) = eps(5,3) + shp(2,a)*ul(3,a,2) + shp(3,a)*ul(2,a,2)
        eps(6,3) = eps(6,3) + shp(3,a)*ul(1,a,2) + shp(1,a)*ul(3,a,2)
      end do ! a
!     Set current coordinate
      xcur(1:3) = xref(1:3) + uu(1:3)

!     Strain rate at t_n+1
      eps(1,1) = gradv(1,1)
      eps(2,1) = gradv(2,2)
      eps(3,1) = gradv(3,3)
      eps(4,1) = gradv(1,2) + gradv(2,1)
      eps(5,1) = gradv(2,3) + gradv(3,2)
      eps(6,1) = gradv(3,1) + gradv(1,3)

!     Strain rate at t_n
      eps(1:6,2) = eps(1:6,1) - eps(1:6,3)

      end subroutine strnr3d
