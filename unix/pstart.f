!$Id:$
      subroutine pstart()
!
!      * * F E A P * * A Finite Element Analysis Program
!                        -      -       -        -
!....  Copyright (c) 1984-2017: Regents of the University of California
!                               All rights reserved

      implicit      none

      include  'codat.h'
      include  'pdata2.h'

!     Start for X11 graphics driver

      idev = 1

!     File input from command line

      fileck = .true.

      end
