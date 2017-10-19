!$Id:$
      subroutine pltime()

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2017: Regents of the University of California
!                               All rights reserved

!-----[--+---------+---------+---------+---------+---------+---------+-]
!      Purpose: Place time on plot window

!      Inputs:  None

!      Outputs: To plot window
!-----[--+---------+---------+---------+---------+---------+---------+-]

      implicit  none

      include  'tdata.h'
      include  'pdatxt.h'

      character yy*15

      save

!     Display time for current view

      dtext = 0.00d0
      call pppcol(1,1)
      yy = ' '
      call tplot(1.13d0 , 0.135d0, yy, 15, 1)
      write(yy, '(6hTime =,1p,1e9.2)' ) ttim
      call tplot(1.13d0 , 0.135d0, yy, 15, 1)

      end
