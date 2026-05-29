!$Id:$
      subroutine pstart()

!      * * F E A P * * A Finite Element Analysis Program
!                        -      -       -        -
!....  Copyright (c) 1984-2026: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!     Modification log                                Date (dd/mm/year)
!       Original version                                    01/11/2006
!       1. Change DFLIB to IFQWIN                           10/04/2014
!       2. Drop IFQWIN; console subsystem with native Win32 29/05/2026
!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Start graphics and set initial parameters
!-----[--.----+----.----+----.-----------------------------------------]
      use        IFWIN
      use        IFPORT

      implicit  none

      include  'codat.h'
      include  'comfil.h'
      include  'iodata.h'
      include  'pdata2.h'
      include  'setups.h'

      character (len=512) :: file_spec, fildata, pathname

      character*(*), parameter:: filter_spec = "Text Files"C // "I*"C
     &             // "All Files"C // "*.*"C // ""C
      character*(*), parameter:: DLGTITLE = "Choose Input File"C

      integer          :: status, ilen, i
      logical (kind=4) :: ldrv

      type(T_OPENFILENAME) :: ofn

!     Graphics Driver for PC version

      idev = 2

!     Get and set input request window

!     Use GetOpenFileName dialog to pick the input file
      if(.true.) then

        ofn%lStructSize       = sizeof(ofn)
        ofn%hwndOwner         = GetForegroundWindow()
        ofn%hInstance         = NULL
        ofn%lpstrFilter       = loc(filter_spec)
        ofn%lpstrCustomFilter = NULL
        ofn%nMaxCustFilter    = 0
        ofn%nFilterIndex      = 1
        ofn%lpstrFile         = loc(file_spec)
        ofn%nMaxFile          = sizeof(file_spec)
        ofn%nMaxFileTitle     = 0
        ofn%lpstrInitialDir   = NULL
        ofn%lpstrTitle        = loc(DLGTITLE)
        ofn%Flags             = OFN_PATHMUSTEXIST
        ofn%lpstrDefExt       = loc("txt"C)
        ofn%lpfnHook          = NULL
        ofn%lpTemplateName    = NULL

        status = GetOpenFileName(ofn)
        fileck = .false.

        if(status.eq.0) then
          call plstop(.true.)
        else
          ilen = index(file_spec,char(0)) - 1
          fildata = file_spec(1:ilen)
          do i = ilen,1,-1
            if(fildata(i:i).eq.'\') then
              pathname = fildata(1:i-1)
              finp     = fildata(i+1:ilen)
              exit
            endif
          end do ! i
          fout      = finp
          fres      = finp
          fsav      = finp
          fplt      = finp
          fout(1:1) = 'O'
          fres(1:1) = 'R'
          fsav(1:1) = 'S'
          fplt(1:1) = 'P'
          status    = CHANGEDIRQQ(pathname)
          open(ios,file='feappvname',status='unknown')
          write(ios,2000) finp,fout,fres,fsav,fplt
          close(ios,status='keep')
        endif

      else
        fileck = .true.
      endif

!     Start versions that use MPI

      mpiflg = .false.
      call mpi_start_feap()

!     Start other versions

      if(.not.mpiflg) then

        call pinstall()
        call filnam()

      endif

2000  format(a/a/a/a/a/1p,1e25.15)

      end subroutine pstart
