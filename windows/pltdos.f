!$Id:$
!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2026: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!     Modification log                                Date (dd/mm/year)
!       Original version                                    01/11/2006
!       1. Change DFLIB to IFQWIN                           10/04/2014
!       2. Force Fit To Size for text window                28/09/2017
!       3. Replace IFQWIN with native Win32 winplot_mod     29/05/2026
!-----[----------------------------------------------------------------]
!      Purpose:  Plot primitive shims for the native Win32 driver.
!                The bodies are thin wrappers around winplot_mod.

!      Inputs / Outputs:  See individual routines
!-----[----------------------------------------------------------------]
      integer function vopnwk()

      use        winplot_mod
      implicit   none
      include   'plflag.h'

      integer         idxl,idyl,jfill
      common /vgraph/ idxl,idyl,jfill

      if(screfl) then
        call winplot_open()
      endif

      idxl   = 1
      idyl   = 1
      jfill  = 2

      vopnwk = 0

      end

      integer function vclrwk()

      use        winplot_mod
      implicit   none

      call winplot_clear()
      vclrwk = 0

      end

      integer function vclswk()

      use        winplot_mod
      implicit   none

      call winplot_close()
      vclswk = 0

      end

      integer function vgtxts(xi,yi,nn,cstr)

      use        winplot_mod
      implicit   none

      include   'pdata2.h'

      integer          :: nn, ix, iy
      real(8)          :: xi,yi
      character(len=1) :: cstr(nn)

!     Convert FEAP-normalized text coordinates (x in [0,1.28],
!     y in [0,1]) to integer device-space coordinates the same
!     way dplot.f converts line coordinates: jx = x*idx, jy = y*idy.

      ix = int(xi*dble(idx))
      iy = int(yi*dble(idy))
      call winplot_text(ix, iy, nn, cstr)

      vgtxts = 0

      end

      integer function vipal(it)

      implicit   none

      integer         idxl,idyl,jfill
      common /vgraph/ idxl,idyl,jfill

      integer :: it
      integer :: ipal(15)

      save

      data  ipal/  #FFFFFF      , !   1: BRIGHTWHITE
     &             #0000FF      , !   2: RED
     &             #00FF00      , !   3: GREEN
     &             #FF0000      , !   4: BLUE
     &             #00FFFF      , !   5: YELLOW
     &             #FFFF00      , !   6: CYAN
     &             #FF00FF      , !   7: MAGENTA
     &             #002020      , !   8: BROWN
     &             #303030      , !   9: WHITE/GRAY
     &             #00003F      , !  10: LIGHTRED
     &             #003F00      , !  11: LIGHTGREEN
     &             #3F0000      , !  12: LIGHTBLUE
     &             #003F3F      , !  13: LIGHTYELLOW
     &             #3F3F00      , !  14: LIGHTCYAN
     &             #3F003F      / !  15: LIGHTMAGENTA

      if(it.gt.0 .and. it.le.15 ) then
        vipal = ipal(it)
        if(jfill.lt.2) vipal = 1
      else
        vipal = #000000
      endif

      end

      integer function vstcol(it)

      use        winplot_mod
      implicit   none

      integer    :: it, vipal, icll

      icll = vipal(it)
      call winplot_set_color_rgb(icll)
      vstcol = icll

      end

      integer function vslcol(it)

      use        winplot_mod
      implicit   none

      integer    :: it, vipal, icll

      icll = vipal(it)
      call winplot_set_color_rgb(icll)
      vslcol = icll

      end

      integer function vpline(ixy,ipen)

      use        winplot_mod
      implicit   none

      integer    :: ipen
      integer    :: ixy(2,*)

      if(ipen.eq.2) then
        call winplot_lineto(ixy(1,1), ixy(2,1))
      elseif(ipen.eq.3) then
        call winplot_moveto(ixy(1,1), ixy(2,1))
      end if
      vpline = 0

      end

      integer function vfarea(npt,ixy)

      use        winplot_mod
      implicit   none

      integer    :: npt, ixy(2,npt)

      call winplot_polyfill(npt, ixy)
      vfarea = 0

      end
