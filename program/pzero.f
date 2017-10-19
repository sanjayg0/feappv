!$Id:$
      subroutine pzero(v,nn)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2017: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Zero real array of data

!      Inputs:
!         nn     - Length of array

!      Outputs:
!         v(*)   - Array with zero values
!-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      integer   n,nn
      real*8    v(nn)

      save

      do n = 1,nn
        v(n) = 0.0d0
      end do

      end
