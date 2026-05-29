!$Id:$
!-----[--.----+----.----+----.-----------------------------------------]
!     * * F E A P * * A Finite Element Analysis Program
!....  Copyright (c) 1984-2026: Regents of the University of California
!                               All rights reserved
!-----[--.----+----.----+----.-----------------------------------------]
!     Purpose:  Native Win32/GDI plot driver for the Windows console
!               build of FEAPpv.  Replaces the QuickWin (IFQWIN) plot
!               implementation.  A background thread owns a top-level
!               window and repaints from an accumulating display list
!               held in FEAP 22000 x 22000 device space, so the plot
!               survives resize, uncover, and minimize/restore events.
!-----[--.----+----.----+----.-----------------------------------------]
      module winplot_mod
        use iso_c_binding
        implicit none
        private

        public :: winplot_open, winplot_close, winplot_is_open
        public :: winplot_clear, winplot_redraw
        public :: winplot_set_color_rgb
        public :: winplot_moveto, winplot_lineto
        public :: winplot_polyfill, winplot_text
        public :: winplot_set_clip
        public :: winplot_poll_pick, winplot_get_pick

!       ----- Win32 constants ----------------------------------------
        integer(c_long), parameter :: WS_OVERLAPPEDWINDOW = &
     &                                int(z'00CF0000',c_long)
        integer(c_long), parameter :: WS_VISIBLE = &
     &                                int(z'10000000',c_long)
        integer(c_int),  parameter :: CS_VREDRAW = 1
        integer(c_int),  parameter :: CS_HREDRAW = 2
        integer(c_int),  parameter :: SW_SHOW    = 5

        integer(c_int),  parameter :: WM_DESTROY     =   2
        integer(c_int),  parameter :: WM_SIZE        =   5
        integer(c_int),  parameter :: WM_PAINT       =  15
        integer(c_int),  parameter :: WM_CLOSE       =  16
        integer(c_int),  parameter :: WM_LBUTTONDOWN = 513
        integer(c_int),  parameter :: WM_RBUTTONDOWN = 516
        integer(c_int),  parameter :: WM_MBUTTONDOWN = 519

        integer(c_int),  parameter :: WHITE_BRUSH = 0
        integer(c_int),  parameter :: BLACK_BRUSH = 4
        integer(c_int),  parameter :: TRANSPARENT = 1
        integer(c_int),  parameter :: PS_SOLID    = 0

!       Display list entry kinds
        integer, parameter :: K_MOVE   = 1
        integer, parameter :: K_LINE   = 2
        integer, parameter :: K_POLY   = 3
        integer, parameter :: K_TEXT   = 4
        integer, parameter :: K_COLOR  = 5
        integer, parameter :: K_CLIP   = 6
        integer, parameter :: K_CLRSCR = 7

!       FEAP device space.  Y increases upward; paint converts to
!       pixel space (Y down) using current client size.  FEAP draws
!       in normalized coordinates with x in [0, 1.28] (the mesh
!       occupies [0, 0.97] and the legend / logo column occupies
!       [0.97, 1.28]) and y in [0, 1].  windows/plstrt.f sets
!       idx = idy = 22000 so the X extent reaches 1.28 * 22000.
        integer, parameter :: DEV_W = 28160
        integer, parameter :: DEV_H = 22000

!       Pick queue
        integer, parameter :: PICK_CAP = 256

!       ----- Win32 structures ---------------------------------------
        type, bind(C) :: T_POINT
          integer(c_long) :: x
          integer(c_long) :: y
        end type T_POINT

        type, bind(C) :: T_RECT
          integer(c_long) :: left
          integer(c_long) :: top
          integer(c_long) :: right
          integer(c_long) :: bottom
        end type T_RECT

        type, bind(C) :: T_MSG
          type(c_ptr)         :: hwnd
          integer(c_int)      :: message
          integer(c_intptr_t) :: wParam
          integer(c_intptr_t) :: lParam
          integer(c_long)     :: time
          type(T_POINT)       :: pt
        end type T_MSG

        type, bind(C) :: T_WNDCLASS
          integer(c_int) :: style
          type(c_funptr) :: lpfnWndProc
          integer(c_int) :: cbClsExtra
          integer(c_int) :: cbWndExtra
          type(c_ptr)    :: hInstance
          type(c_ptr)    :: hIcon
          type(c_ptr)    :: hCursor
          type(c_ptr)    :: hbrBackground
          type(c_ptr)    :: lpszMenuName
          type(c_ptr)    :: lpszClassName
        end type T_WNDCLASS

!       Opaque PAINTSTRUCT buffer (~72 bytes on x64; 20 longs is safe).
        type, bind(C) :: T_PAINTSTRUCT
          integer(c_long) :: buffer(20)
        end type T_PAINTSTRUCT

!       Opaque CRITICAL_SECTION buffer (40 bytes on x64).
        type, bind(C) :: T_CRITSEC
          integer(c_long) :: buffer(10)
        end type T_CRITSEC

!       ----- Display list -------------------------------------------
        type :: dl_t
          integer                       :: kind = 0
          integer(c_long)               :: rgb  = 0_c_long
          integer                       :: ix1  = 0
          integer                       :: iy1  = 0
          integer                       :: ix2  = 0
          integer                       :: iy2  = 0
          integer                       :: npt  = 0
          integer, allocatable          :: poly(:,:)
          character(len=80)             :: text = ' '
          integer                       :: tlen = 0
          real(c_double)                :: tx   = 0.0_c_double
          real(c_double)                :: ty   = 0.0_c_double
        end type dl_t

!       ----- Module state -------------------------------------------
        type(dl_t), allocatable :: dl(:)
        integer :: dl_n   = 0
        integer :: dl_cap = 0

        integer :: pick_btn(PICK_CAP)
        integer :: pick_xd(PICK_CAP), pick_yd(PICK_CAP)
        integer :: pick_head  = 1
        integer :: pick_tail  = 1
        integer :: pick_count = 0

        type(c_ptr) :: g_hwnd    = c_null_ptr
        type(c_ptr) :: g_hthread = c_null_ptr
        type(c_ptr) :: g_hready  = c_null_ptr
        type(c_ptr) :: g_hpick   = c_null_ptr
        type(T_CRITSEC), target, save :: g_cs
        logical :: g_open = .false.


!       ----- Win32 API interfaces -----------------------------------
        interface
          function GetModuleHandle(name) &
     &        bind(C,name='GetModuleHandleA')
            import
            type(c_ptr) :: GetModuleHandle
            type(c_ptr), value :: name
          end function

          function GetStockObject(fnObject) &
     &        bind(C,name='GetStockObject')
            import
            type(c_ptr) :: GetStockObject
            integer(c_int), value :: fnObject
          end function

          function RegisterClass(lpWndClass) &
     &        bind(C,name='RegisterClassA')
            import
            integer(c_short) :: RegisterClass
            type(c_ptr), value :: lpWndClass
          end function

          function CreateWindowEx(dwExStyle,lpClassName,lpWindowName, &
     &        dwStyle,x,y,nW,nH,hWndParent,hMenu,hInst,lpParam) &
     &        bind(C,name='CreateWindowExA')
            import
            type(c_ptr) :: CreateWindowEx
            integer(c_long), value :: dwExStyle
            type(c_ptr), value :: lpClassName, lpWindowName
            integer(c_long), value :: dwStyle
            integer(c_int), value :: x, y, nW, nH
            type(c_ptr), value :: hWndParent, hMenu, hInst, lpParam
          end function

          function DefWindowProc(hwnd,msg,wParam,lParam) &
     &        bind(C,name='DefWindowProcA')
            import
            integer(c_intptr_t) :: DefWindowProc
            type(c_ptr), value :: hwnd
            integer(c_int), value :: msg
            integer(c_intptr_t), value :: wParam, lParam
          end function

          function GetMessage(lpMsg,hWnd,wMin,wMax) &
     &        bind(C,name='GetMessageA')
            import
            integer(c_int) :: GetMessage
            type(c_ptr), value :: lpMsg, hWnd
            integer(c_int), value :: wMin, wMax
          end function

          function TranslateMessage(lpMsg) &
     &        bind(C,name='TranslateMessage')
            import
            integer(c_int) :: TranslateMessage
            type(c_ptr), value :: lpMsg
          end function

          function DispatchMessage(lpMsg) &
     &        bind(C,name='DispatchMessageA')
            import
            integer(c_intptr_t) :: DispatchMessage
            type(c_ptr), value :: lpMsg
          end function

          subroutine PostQuitMessage(nCode) &
     &        bind(C,name='PostQuitMessage')
            import
            integer(c_int), value :: nCode
          end subroutine

          function PostMessage(hWnd,msg,wParam,lParam) &
     &        bind(C,name='PostMessageA')
            import
            integer(c_int) :: PostMessage
            type(c_ptr), value :: hWnd
            integer(c_int), value :: msg
            integer(c_intptr_t), value :: wParam, lParam
          end function

          function ShowWindow(hWnd,nCmdShow) &
     &        bind(C,name='ShowWindow')
            import
            integer(c_int) :: ShowWindow
            type(c_ptr), value :: hWnd
            integer(c_int), value :: nCmdShow
          end function

          function UpdateWindow(hWnd) &
     &        bind(C,name='UpdateWindow')
            import
            integer(c_int) :: UpdateWindow
            type(c_ptr), value :: hWnd
          end function

          function InvalidateRect(hWnd,lpRect,bErase) &
     &        bind(C,name='InvalidateRect')
            import
            integer(c_int) :: InvalidateRect
            type(c_ptr), value :: hWnd
            type(c_ptr), value :: lpRect
            integer(c_int), value :: bErase
          end function

          function GetClientRect(hWnd,lpRect) &
     &        bind(C,name='GetClientRect')
            import
            integer(c_int) :: GetClientRect
            type(c_ptr), value :: hWnd
            type(c_ptr), value :: lpRect
          end function

          function BeginPaint(hWnd,lpPaint) &
     &        bind(C,name='BeginPaint')
            import
            type(c_ptr) :: BeginPaint
            type(c_ptr), value :: hWnd
            type(c_ptr), value :: lpPaint
          end function

          function EndPaint(hWnd,lpPaint) &
     &        bind(C,name='EndPaint')
            import
            integer(c_int) :: EndPaint
            type(c_ptr), value :: hWnd
            type(c_ptr), value :: lpPaint
          end function

          function CreatePen(iStyle,cWidth,cColor) &
     &        bind(C,name='CreatePen')
            import
            type(c_ptr) :: CreatePen
            integer(c_int), value :: iStyle, cWidth
            integer(c_long), value :: cColor
          end function

          function CreateSolidBrush(crColor) &
     &        bind(C,name='CreateSolidBrush')
            import
            type(c_ptr) :: CreateSolidBrush
            integer(c_long), value :: crColor
          end function

          function SelectObject(hdc,hgdiobj) &
     &        bind(C,name='SelectObject')
            import
            type(c_ptr) :: SelectObject
            type(c_ptr), value :: hdc, hgdiobj
          end function

          function DeleteObject(ho) &
     &        bind(C,name='DeleteObject')
            import
            integer(c_int) :: DeleteObject
            type(c_ptr), value :: ho
          end function

          function MoveToEx(hdc,x,y,lpPoint) &
     &        bind(C,name='MoveToEx')
            import
            integer(c_int) :: MoveToEx
            type(c_ptr), value :: hdc
            integer(c_int), value :: x, y
            type(c_ptr), value :: lpPoint
          end function

          function LineTo(hdc,x,y) bind(C,name='LineTo')
            import
            integer(c_int) :: LineTo
            type(c_ptr), value :: hdc
            integer(c_int), value :: x, y
          end function

          function Polygon(hdc,lpPts,cPts) bind(C,name='Polygon')
            import
            integer(c_int) :: Polygon
            type(c_ptr), value :: hdc
            type(c_ptr), value :: lpPts
            integer(c_int), value :: cPts
          end function

          function SetTextColor(hdc,color) &
     &        bind(C,name='SetTextColor')
            import
            integer(c_long) :: SetTextColor
            type(c_ptr), value :: hdc
            integer(c_long), value :: color
          end function

          function SetBkMode(hdc,mode) &
     &        bind(C,name='SetBkMode')
            import
            integer(c_int) :: SetBkMode
            type(c_ptr), value :: hdc
            integer(c_int), value :: mode
          end function

          function TextOut(hdc,x,y,lpString,n) &
     &        bind(C,name='TextOutA')
            import
            integer(c_int) :: TextOut
            type(c_ptr), value :: hdc
            integer(c_int), value :: x, y
            type(c_ptr), value :: lpString
            integer(c_int), value :: n
          end function

          function IntersectClipRect(hdc,l,t,r,b) &
     &        bind(C,name='IntersectClipRect')
            import
            integer(c_int) :: IntersectClipRect
            type(c_ptr), value :: hdc
            integer(c_int), value :: l, t, r, b
          end function

          function SelectClipRgn(hdc,hrgn) &
     &        bind(C,name='SelectClipRgn')
            import
            integer(c_int) :: SelectClipRgn
            type(c_ptr), value :: hdc
            type(c_ptr), value :: hrgn
          end function

          function AdjustWindowRect(lpRect,dwStyle,bMenu) &
     &        bind(C,name='AdjustWindowRect')
            import
            integer(c_int) :: AdjustWindowRect
            type(c_ptr), value :: lpRect
            integer(c_long), value :: dwStyle
            integer(c_int), value :: bMenu
          end function

          function FillRect(hdc,lpRect,hBrush) &
     &        bind(C,name='FillRect')
            import
            integer(c_int) :: FillRect
            type(c_ptr), value :: hdc
            type(c_ptr), value :: lpRect, hBrush
          end function

          function CreateThread(lpAttr,dwStack,lpStart,lpParam, &
     &        dwFlags,lpId) bind(C,name='CreateThread')
            import
            type(c_ptr) :: CreateThread
            type(c_ptr), value :: lpAttr
            integer(c_intptr_t), value :: dwStack
            type(c_funptr), value :: lpStart
            type(c_ptr), value :: lpParam
            integer(c_long), value :: dwFlags
            type(c_ptr), value :: lpId
          end function

          function WaitForSingleObject(hHandle,dwMs) &
     &        bind(C,name='WaitForSingleObject')
            import
            integer(c_long) :: WaitForSingleObject
            type(c_ptr), value :: hHandle
            integer(c_long), value :: dwMs
          end function

          function CreateEvent(sa,manual,init,name) &
     &        bind(C,name='CreateEventA')
            import
            type(c_ptr) :: CreateEvent
            type(c_ptr), value :: sa
            integer(c_int), value :: manual, init
            type(c_ptr), value :: name
          end function

          function SetEvent(h) bind(C,name='SetEvent')
            import
            integer(c_int) :: SetEvent
            type(c_ptr), value :: h
          end function

          subroutine InitializeCriticalSection(cs) &
     &        bind(C,name='InitializeCriticalSection')
            import
            type(c_ptr), value :: cs
          end subroutine

          subroutine DeleteCriticalSection(cs) &
     &        bind(C,name='DeleteCriticalSection')
            import
            type(c_ptr), value :: cs
          end subroutine

          subroutine EnterCriticalSection(cs) &
     &        bind(C,name='EnterCriticalSection')
            import
            type(c_ptr), value :: cs
          end subroutine

          subroutine LeaveCriticalSection(cs) &
     &        bind(C,name='LeaveCriticalSection')
            import
            type(c_ptr), value :: cs
          end subroutine
        end interface

      contains

        logical function winplot_is_open()
          winplot_is_open = g_open
        end function

        subroutine dl_reserve(n)
          integer, intent(in) :: n
          type(dl_t), allocatable :: tmp(:)
          integer :: newcap
          if (n .le. dl_cap) return
          newcap = max(4096, dl_cap*2)
          do while (newcap .lt. n)
            newcap = newcap * 2
          end do
          allocate(tmp(newcap))
          if (dl_n .gt. 0) tmp(1:dl_n) = dl(1:dl_n)
          if (allocated(dl)) deallocate(dl)
          call move_alloc(tmp, dl)
          dl_cap = newcap
        end subroutine dl_reserve

        subroutine winplot_redraw()
          integer :: r
          if (.not. g_open) return
          r = InvalidateRect(g_hwnd, c_null_ptr, 1)
        end subroutine

        subroutine winplot_clear()
          integer :: i
          if (.not. g_open) return
          call EnterCriticalSection(c_loc(g_cs))
          do i = 1, dl_n
            if (allocated(dl(i)%poly)) deallocate(dl(i)%poly)
          end do
          dl_n = 0
          call dl_reserve(1)
          dl_n = 1
          dl(1)%kind = K_CLRSCR
          call LeaveCriticalSection(c_loc(g_cs))
          call winplot_redraw()
        end subroutine

        subroutine winplot_set_color_rgb(rgb)
          integer, intent(in) :: rgb
          if (.not. g_open) return
          call EnterCriticalSection(c_loc(g_cs))
          call dl_reserve(dl_n+1)
          dl_n = dl_n + 1
          dl(dl_n)%kind = K_COLOR
          dl(dl_n)%rgb  = int(rgb, c_long)
          call LeaveCriticalSection(c_loc(g_cs))
        end subroutine

        subroutine winplot_moveto(ix, iy)
          integer, intent(in) :: ix, iy
          if (.not. g_open) return
          call EnterCriticalSection(c_loc(g_cs))
          call dl_reserve(dl_n+1)
          dl_n = dl_n + 1
          dl(dl_n)%kind = K_MOVE
          dl(dl_n)%ix1  = ix
          dl(dl_n)%iy1  = iy
          call LeaveCriticalSection(c_loc(g_cs))
        end subroutine

        subroutine winplot_lineto(ix, iy)
          integer, intent(in) :: ix, iy
          if (.not. g_open) return
          call EnterCriticalSection(c_loc(g_cs))
          call dl_reserve(dl_n+1)
          dl_n = dl_n + 1
          dl(dl_n)%kind = K_LINE
          dl(dl_n)%ix1  = ix
          dl(dl_n)%iy1  = iy
          call LeaveCriticalSection(c_loc(g_cs))
        end subroutine

        subroutine winplot_polyfill(npt, ixy)
          integer, intent(in) :: npt
          integer, intent(in) :: ixy(2, npt)
          if (.not. g_open) return
          if (npt .le. 0) return
          call EnterCriticalSection(c_loc(g_cs))
          call dl_reserve(dl_n+1)
          dl_n = dl_n + 1
          dl(dl_n)%kind = K_POLY
          dl(dl_n)%npt  = npt
          allocate(dl(dl_n)%poly(2, npt))
          dl(dl_n)%poly = ixy
          call LeaveCriticalSection(c_loc(g_cs))
        end subroutine

!       Text placement uses the same FEAP device space as line/poly
!       primitives: ix, iy are integer coordinates in DEV_W x DEV_H
!       (i.e., FEAP-normalized x*idx, y*idy), with Y increasing
!       upward.  paint_dl runs them through dev2px just like lines.
        subroutine winplot_text(ix, iy, n, cstr)
          integer,          intent(in) :: ix, iy
          integer,          intent(in) :: n
          character(len=1), intent(in) :: cstr(n)
          integer :: i, m
          if (.not. g_open) return
          call EnterCriticalSection(c_loc(g_cs))
          call dl_reserve(dl_n+1)
          dl_n = dl_n + 1
          dl(dl_n)%kind = K_TEXT
          dl(dl_n)%ix1  = ix
          dl(dl_n)%iy1  = iy
          m = min(n, len(dl(dl_n)%text))
          dl(dl_n)%text = ' '
          do i = 1, m
            dl(dl_n)%text(i:i) = cstr(i)
          end do
          dl(dl_n)%tlen = m
          call LeaveCriticalSection(c_loc(g_cs))
        end subroutine

        subroutine winplot_set_clip(xmin, ymin, xmax, ymax)
          integer, intent(in) :: xmin, ymin, xmax, ymax
          if (.not. g_open) return
          call EnterCriticalSection(c_loc(g_cs))
          call dl_reserve(dl_n+1)
          dl_n = dl_n + 1
          dl(dl_n)%kind = K_CLIP
          dl(dl_n)%ix1  = xmin
          dl(dl_n)%iy1  = ymin
          dl(dl_n)%ix2  = xmax
          dl(dl_n)%iy2  = ymax
          call LeaveCriticalSection(c_loc(g_cs))
        end subroutine

        subroutine dev2px(xd, yd, w, h, px, py)
          integer, intent(in)  :: xd, yd, w, h
          integer, intent(out) :: px, py
          px = int(real(xd,c_double) * real(w,c_double) &
     &                                / real(DEV_W,c_double))
          py = int((real(DEV_H,c_double) - real(yd,c_double)) &
     &           * real(h,c_double) / real(DEV_H,c_double))
        end subroutine

        subroutine paint_dl(hdc, w, h)
          type(c_ptr), value :: hdc
          integer, intent(in) :: w, h
          integer :: i, j, px, py, npt
          integer :: px2, py2, ltmp
          integer(c_long) :: cur_rgb
          type(c_ptr) :: hpen_old, hbr_old, hpen, hbr, hbg, tmp_p
          type(T_RECT), target :: rc
          type(T_POINT), target :: pt0
          integer, allocatable, target :: pts(:)
          character(kind=c_char,len=:), allocatable, target :: ctext
          integer :: r

          hbg = GetStockObject(BLACK_BRUSH)
          rc%left = 0; rc%top = 0
          rc%right = int(w, c_long); rc%bottom = int(h, c_long)
          r = FillRect(hdc, c_loc(rc), hbg)

!         Default pen is white so any draws issued before FEAP sets a
!         colour are still visible against the black background.
          cur_rgb  = int(z'FFFFFF', c_long)
          hpen     = CreatePen(PS_SOLID, 1, cur_rgb)
          hpen_old = SelectObject(hdc, hpen)
          hbr      = CreateSolidBrush(cur_rgb)
          hbr_old  = SelectObject(hdc, hbr)
          r = SetBkMode(hdc, TRANSPARENT)
          r = int(SetTextColor(hdc, cur_rgb))

          do i = 1, dl_n
            select case (dl(i)%kind)
            case (K_CLRSCR)
              rc%left = 0; rc%top = 0
              rc%right = int(w, c_long); rc%bottom = int(h, c_long)
              r = FillRect(hdc, c_loc(rc), hbg)
            case (K_COLOR)
              cur_rgb = dl(i)%rgb
              tmp_p = SelectObject(hdc, hpen_old)
              r     = DeleteObject(hpen)
              hpen  = CreatePen(PS_SOLID, 1, cur_rgb)
              tmp_p = SelectObject(hdc, hpen)
              tmp_p = SelectObject(hdc, hbr_old)
              r     = DeleteObject(hbr)
              hbr   = CreateSolidBrush(cur_rgb)
              tmp_p = SelectObject(hdc, hbr)
              r = int(SetTextColor(hdc, cur_rgb))
            case (K_MOVE)
              call dev2px(dl(i)%ix1, dl(i)%iy1, w, h, px, py)
              r = MoveToEx(hdc, px, py, c_null_ptr)
            case (K_LINE)
              call dev2px(dl(i)%ix1, dl(i)%iy1, w, h, px, py)
              r = LineTo(hdc, px, py)
            case (K_POLY)
              npt = dl(i)%npt
              if (npt .ge. 2) then
                allocate(pts(2*npt))
                do j = 1, npt
                  call dev2px(dl(i)%poly(1,j), dl(i)%poly(2,j), &
     &                        w, h, px, py)
                  pts(2*j-1) = px
                  pts(2*j)   = py
                end do
                r = Polygon(hdc, c_loc(pts), npt)
                deallocate(pts)
              end if
            case (K_CLIP)
!             TEMPORARY: skip clipping entirely while we debug.  The
!             FEAP clip rectangle from windows/dplot.f is degenerate
!             in the (fwin .and. clchk) branch (wmin == wmax), which
!             would zero the clip region and hide every subsequent
!             draw.  Leaving the DC clip at the BeginPaint default
!             (full update region) lets us verify the drawing path.
              r = SelectClipRgn(hdc, c_null_ptr)
            case (K_TEXT)
              call dev2px(dl(i)%ix1, dl(i)%iy1, w, h, px, py)
              if (dl(i)%tlen .gt. 0) then
                allocate(character(kind=c_char, &
     &                              len=dl(i)%tlen+1) :: ctext)
                ctext = dl(i)%text(1:dl(i)%tlen) // c_null_char
                r = TextOut(hdc, px, py, c_loc(ctext), dl(i)%tlen)
                deallocate(ctext)
              end if
            end select
          end do

          tmp_p = SelectObject(hdc, hpen_old); r = DeleteObject(hpen)
          tmp_p = SelectObject(hdc, hbr_old);  r = DeleteObject(hbr)
        end subroutine paint_dl

        subroutine pick_push(btn, ixp, iyp, w, h)
          integer, intent(in) :: btn, ixp, iyp, w, h
          integer :: xd, yd
          xd = int(real(ixp,c_double) * real(DEV_W,c_double) &
     &                                  / real(w,c_double))
          yd = DEV_H - int(real(iyp,c_double) * real(DEV_H,c_double) &
     &                                          / real(h,c_double))
          call EnterCriticalSection(c_loc(g_cs))
          if (pick_count .lt. PICK_CAP) then
            pick_btn(pick_tail) = btn
            pick_xd(pick_tail)  = xd
            pick_yd(pick_tail)  = yd
            pick_tail = pick_tail + 1
            if (pick_tail .gt. PICK_CAP) pick_tail = 1
            pick_count = pick_count + 1
          end if
          call LeaveCriticalSection(c_loc(g_cs))
          if (c_associated(g_hpick)) then
            xd = SetEvent(g_hpick)
          end if
        end subroutine pick_push

        logical function winplot_poll_pick()
          call EnterCriticalSection(c_loc(g_cs))
          winplot_poll_pick = (pick_count .gt. 0)
          call LeaveCriticalSection(c_loc(g_cs))
        end function

        subroutine winplot_get_pick(btn, xd, yd, ok)
          integer, intent(out) :: btn, xd, yd
          logical, intent(out) :: ok
          call EnterCriticalSection(c_loc(g_cs))
          if (pick_count .gt. 0) then
            btn = pick_btn(pick_head)
            xd  = pick_xd(pick_head)
            yd  = pick_yd(pick_head)
            pick_head = pick_head + 1
            if (pick_head .gt. PICK_CAP) pick_head = 1
            pick_count = pick_count - 1
            ok = .true.
          else
            btn = 0; xd = 0; yd = 0
            ok = .false.
          end if
          call LeaveCriticalSection(c_loc(g_cs))
        end subroutine

        function winplot_wndproc(hwnd, msg, wParam, lParam) &
     &           bind(C) result(lres)
          type(c_ptr), value         :: hwnd
          integer(c_int), value      :: msg
          integer(c_intptr_t), value :: wParam, lParam
          integer(c_intptr_t)        :: lres
          type(T_PAINTSTRUCT), target :: ps
          type(T_RECT),        target :: rc
          type(c_ptr) :: hdc
          integer     :: w, h, ixp, iyp, r

          select case (msg)
          case (WM_PAINT)
            hdc = BeginPaint(hwnd, c_loc(ps))
            r = GetClientRect(hwnd, c_loc(rc))
            w = int(rc%right - rc%left)
            h = int(rc%bottom - rc%top)
            call EnterCriticalSection(c_loc(g_cs))
            call paint_dl(hdc, w, h)
            call LeaveCriticalSection(c_loc(g_cs))
            r = EndPaint(hwnd, c_loc(ps))
            lres = 0
          case (WM_SIZE)
            r = InvalidateRect(hwnd, c_null_ptr, 1)
            lres = 0
          case (WM_LBUTTONDOWN, WM_RBUTTONDOWN, WM_MBUTTONDOWN)
            r = GetClientRect(hwnd, c_loc(rc))
            w = int(rc%right - rc%left)
            h = int(rc%bottom - rc%top)
            ixp = int(iand(lParam, int(z'FFFF',c_intptr_t)))
            iyp = int(iand(ishft(lParam,-16), &
     &                     int(z'FFFF',c_intptr_t)))
            if (msg .eq. WM_LBUTTONDOWN) then
              call pick_push(1, ixp, iyp, w, h)
            else if (msg .eq. WM_RBUTTONDOWN) then
              call pick_push(3, ixp, iyp, w, h)
            else
              call pick_push(2, ixp, iyp, w, h)
            end if
            lres = 0
          case (WM_CLOSE)
            g_open = .false.
            lres = DefWindowProc(hwnd, msg, wParam, lParam)
          case (WM_DESTROY)
            call PostQuitMessage(0)
            lres = 0
          case default
            lres = DefWindowProc(hwnd, msg, wParam, lParam)
          end select
        end function winplot_wndproc

        function winplot_thread_func(lpParam) bind(C) result(rc)
          type(c_ptr), value :: lpParam
          integer(c_long)    :: rc
          type(T_WNDCLASS),  target :: wc
          type(T_MSG),       target :: msg
          character(kind=c_char,len=*), parameter :: &
     &        class_name = 'FeapPlotWnd'//c_null_char
          character(kind=c_char,len=*), parameter :: &
     &        wnd_title  = 'F E A P p v   P l o t s'//c_null_char
          character(kind=c_char), target, save :: &
     &        cls(len(class_name))
          character(kind=c_char), target, save :: &
     &        ttl(len(wnd_title))
          type(c_ptr) :: hInst
          integer     :: i, ires
          integer(c_short) :: atom
          type(T_RECT), target :: wrc
          integer :: wnd_w, wnd_h
!         Match the FEAP device-space aspect (DEV_W : DEV_H = 1.28)
!         so the mesh and the legend / logo column all stay inside
!         the client area without distortion.
          integer, parameter :: CLIENT_W = 800
          integer, parameter :: CLIENT_H = 625

          do i = 1, len(class_name)
            cls(i) = class_name(i:i)
          end do
          do i = 1, len(wnd_title)
            ttl(i) = wnd_title(i:i)
          end do

          hInst = GetModuleHandle(c_null_ptr)

          wc%style         = ior(CS_HREDRAW, CS_VREDRAW)
          wc%lpfnWndProc   = c_funloc(winplot_wndproc)
          wc%cbClsExtra    = 0
          wc%cbWndExtra    = 0
          wc%hInstance     = hInst
          wc%hIcon         = c_null_ptr
          wc%hCursor       = c_null_ptr
          wc%hbrBackground = GetStockObject(BLACK_BRUSH)
          wc%lpszMenuName  = c_null_ptr
          wc%lpszClassName = c_loc(cls)

          atom = RegisterClass(c_loc(wc))

!         Size the outer window so the client area is CLIENT_W x
!         CLIENT_H.  FEAP plots in a 22000 x 22000 square device
!         space, so a square client preserves aspect and keeps the
!         legend and logo inside the visible area.
          wrc%left   = 0
          wrc%top    = 0
          wrc%right  = int(CLIENT_W, c_long)
          wrc%bottom = int(CLIENT_H, c_long)
          ires = AdjustWindowRect(c_loc(wrc), WS_OVERLAPPEDWINDOW, 0)
          wnd_w = int(wrc%right  - wrc%left)
          wnd_h = int(wrc%bottom - wrc%top)

          g_hwnd = CreateWindowEx(0_c_long, c_loc(cls), c_loc(ttl), &
     &        ior(WS_OVERLAPPEDWINDOW, WS_VISIBLE),                  &
     &        80, 60, wnd_w, wnd_h,                                  &
     &        c_null_ptr, c_null_ptr, hInst, c_null_ptr)

          g_open = c_associated(g_hwnd)
          ires   = ShowWindow(g_hwnd, SW_SHOW)
          ires   = UpdateWindow(g_hwnd)

          if (c_associated(g_hready)) ires = SetEvent(g_hready)

          do
            ires = GetMessage(c_loc(msg), c_null_ptr, 0, 0)
            if (ires .le. 0) exit
            ires = TranslateMessage(c_loc(msg))
            ires = int(DispatchMessage(c_loc(msg)))
          end do

          g_open = .false.
          rc = 0_c_long
        end function winplot_thread_func

        subroutine winplot_open()
          integer(c_long) :: wret
          if (g_open) return
          call InitializeCriticalSection(c_loc(g_cs))
          call dl_reserve(4096)
          dl_n = 0
          pick_head = 1; pick_tail = 1; pick_count = 0
          g_hready = CreateEvent(c_null_ptr, 1, 0, c_null_ptr)
          g_hpick  = CreateEvent(c_null_ptr, 0, 0, c_null_ptr)
          g_hthread = CreateThread(c_null_ptr, 0_c_intptr_t, &
     &        c_funloc(winplot_thread_func), c_null_ptr,    &
     &        0_c_long, c_null_ptr)
          if (c_associated(g_hready)) then
            wret = WaitForSingleObject(g_hready, int(5000,c_long))
          end if
          if (.not. g_open) then
            write(*,'(a)') ' *ERROR* Plot window failed to open'
          end if
        end subroutine winplot_open

        subroutine winplot_close()
          integer :: ires
          integer(c_long) :: wret
          if (.not. g_open) return
          ires = PostMessage(g_hwnd, WM_CLOSE, 0_c_intptr_t, &
     &                       0_c_intptr_t)
          if (c_associated(g_hthread)) then
            wret = WaitForSingleObject(g_hthread, int(2000,c_long))
          end if
          g_open  = .false.
          g_hwnd  = c_null_ptr
        end subroutine winplot_close

      end module winplot_mod

