!$Id:$
      subroutine strnr2d(d,xl,ul,th,shp,ndm,ndf,nel, uu, gradv, eps,ta)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2024: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!     Modification log                                Date (dd/mm/year)
!       Original version                                    08/04/2018
!       1. Correct use of shp(4,*) to shp(3,*)              12/01/2019
!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Two dimensional strain rate calculations

!      Inputs:

!      Outputs:
!        uu(3,3)      - Velocity at t_n+1 and t_n
!        gradv(3,3,3) - Velocity gradient at t_n+1 and t_n
!        ta           - Temperature
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'cdata.h'
      include  'elcoor.h'
      include  'elpers.h'

      integer   ndm,ndf,nel, a,i
      real*8    d(*),xl(ndm,*),ul(ndf,nen,*),th(*),shp(3,*)
      real*8    uu(3,3), gradv(3,3,3),eps(9,3), ta

      save

!     Compute strain rate at point
      xref(:)      = 0.0d0
      uu(:,:)      = 0.0d0
      gradv(:,:,:) = 0.0d0
      eps(:,:)     = 0.0d0

!     Compute temperature, coordinate, velocity and gradient
      ta = -d(9)
      do a = 1,nel
        ta        = ta        + shp(3,a)*th(a)
        xref(1:2) = xref(1:2) + shp(3,a)*xl(1:2,a)
        uu(1:2,1) = uu(1:2,1) + shp(3,a)*ul(1:2,a,1)
        uu(1:2,3) = uu(1:2,3) + shp(3,a)*ul(1:2,a,2)
        do i = 1,2
          gradv(1:2,i,1) = gradv(1:2,i,1) + ul(1:2,a,1)*shp(i,a)
          gradv(1:2,i,3) = gradv(1:2,i,3) + ul(1:2,a,2)*shp(i,a)
        end do ! i
      end do ! a

!     Set current coordinate
      xcur(1:3) = xref(1:3) + uu(1:3,1)

!     Velocity at t_n
      uu(:,2) = uu(:,1) - uu(:,3)

!     Gradient at t_n
      gradv(:,:,2) = gradv(:,:,1) - gradv(:,:,3)

!     Strain rate at t_n+1
      eps(1,1) = gradv(1,1,1)
      eps(2,1) = gradv(2,2,1)
      eps(3,1) = 0.0d0
      eps(4,1) = gradv(1,2,1) + gradv(2,1,1)
      eps(5,1) = 0.0d0
      eps(6,1) = 0.0d0

!     Incrmental Strain rate at t_n+1
      eps(1,3) = gradv(1,1,3)
      eps(2,3) = gradv(2,2,3)
      eps(3,3) = 0.0d0
      eps(4,3) = gradv(1,2,3) + gradv(2,1,3)
      eps(5,3) = 0.0d0
      eps(6,1) = 0.0d0

!     Strain rate at t_n
      eps(1:6,2) = eps(1:6,1) - eps(1:6,3)

      end subroutine strnr2d
