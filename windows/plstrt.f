!$Id:$
      subroutine plstrt()

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2017: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Open a graphics device to receive plot data

!      Inputs:
!         none

!      Outputs:
!         none      - Graphics window should appear after call
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'pdata2.h'
      include  'plflag.h'

      integer   i, status,vopnwk,vclrwk

      save

!     Open devices for Graphics output

      everon = .true.

      idx = 22000
      idy = 22000

      status = vopnwk()
      status = vclrwk()
      i = 1
      call pppcol(i,1)
      call plbord(i)

      end
