!$Id:$
      subroutine pzeroi(ii,nn)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2017: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Zero integer array of data

!      Inputs:
!         nn     - Length of array

!      Outputs:
!         ii(*)  - Array with zero values
!-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      integer   n,nn
      integer   ii(nn)

      save

!     Zero integer array

      do n = 1,nn
        ii(n) = 0
      end do

      end
