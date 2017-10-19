!$Id:$
      subroutine shptri(el, nel, shp)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2017: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Computes shape function and derivatives for
!               triangular elements

!      Inputs:
!         el(2)     - Natural coordinates for point
!         nel       - Number of nodes on element

!      Outputs:
!         shp(3,*)  - Shape functions and derivatives at point
!                     shp(1,i) = dN_i/dxi_1
!                     shp(2,i) = dN_i/dxi_2
!                     shp(3,i) = N_i
!-----[--.----+----.----+----.-----------------------------------------]
      implicit   none

      integer    nel
      real*8     el(4), shp(3,*), fac

      if(nel.eq.3) then
        shp(1,1) = -1.0d0
        shp(2,1) = -1.0d0
        shp(3,1) =  1.0d0 - el(1) - el(2)

        shp(1,2) =  1.0d0
        shp(2,2) =  0.0d0
        shp(3,2) =  el(1)

        shp(1,3) =  0.0d0
        shp(2,3) =  1.0d0
        shp(3,3) =  el(2)

      else
        fac      =  1.d0 - el(1) - el(2)
        shp(1,1) =  4.0d0*(el(1) + el(2)) - 3.0d0
        shp(2,1) =  4.0d0*(el(1) + el(2)) - 3.0d0
        shp(3,1) =  2.0d0*fac*fac - fac

        shp(1,2) =  4.0d0*el(1) - 1.0d0
        shp(2,2) =  0.0d0
        shp(3,2) =  2.0d0*el(1)*el(1) - el(1)

        shp(1,3) =  0.0d0
        shp(2,3) =  4.0d0*el(2) - 1.0d0
        shp(3,3) =  2.0d0*el(2)*el(2) - el(2)

        shp(1,4) =  4.0d0 - 8.0d0*el(1) - 4.0d0*el(2)
        shp(2,4) = -4.0d0*el(1)
        shp(3,4) =  4.0d0*el(1)*fac

        shp(1,5) =  4.0d0*el(2)
        shp(2,5) =  4.0d0*el(1)
        shp(3,5) =  4.0d0*el(1)*el(2)

        shp(1,6) = -4.0d0*el(2)
        shp(2,6) =  4.0d0 - 4.0d0*el(1) - 8.0d0*el(2)
        shp(3,6) =  4.0d0*el(2)*fac

        if(nel.eq.7) then    ! Hierarchic bubble
          shp(1,7) = -27.0d0*el(2)*(2.0d0*el(1) + el(2))
          shp(2,7) = -27.0d0*el(1)*(el(1) + 2.0d0*el(2))
          shp(3,7) =  27.0d0*el(1)*el(2)*fac
        endif

      endif

      end
