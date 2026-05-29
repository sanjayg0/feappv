!$Id:$
      subroutine plclos()

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2026: Regents of the University of California
!                               All rights reserved

!-----[--+---------+---------+---------+---------+---------+---------+-]
!      Purpose: Close plot device

!      Inputs:
!         none

!      Outputs:
!         none      - Returns command outputs to text device
!-----[--+---------+---------+---------+---------+---------+---------+-]
      use       winplot_mod

      implicit  none

      include  'print.h'

      save

!     Close plot device

      fopn = .false.

!     Trigger a repaint of the native Win32 plot window so the display
!     list accumulated since plopen() becomes visible.

      call winplot_redraw()

      end subroutine plclos
