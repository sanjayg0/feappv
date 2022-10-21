!$Id:$
      subroutine plstop(eflag)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2021: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!     Modification log                                Date (dd/mm/year)
!       Original version                                    01/11/2006
!       1. Change DFLIB to IFQWIN                           10/04/2014
!-----[--+---------+---------+---------+---------+---------+---------+-]
!      Purpose: Close any open plot windows and stop execution

!      Inputs:
!         eflag

!      Outputs:
!         none
!-----[--+---------+---------+---------+---------+---------+---------+-]
      use       IFQWIN

      implicit  none

      include  'iofile.h'
      include  'pdatps.h'
      include  'plflag.h'

      logical       :: eflag
      integer       :: p_status,vclrwk,vclswk

      save

!     Error message

      if(eflag) then
        write(*,'(a)')
     &       ' --> ERRORS OCCURRED: For details see output file.'
      endif

!     Close PostScript file if open

      if (hdcpy) call fpplcl()

      if(everon) then
        p_status = vclrwk()
        p_status = vclswk()
      endif

!     Clear last time history plot

      call ptimpl()

!     Close parallel arrays

      call parstop()

!     Close last input & output file

      close(unit=ior, status = 'keep')
      close(unit=iow, status = 'keep')

      p_status = setexitqq(QWIN$EXITNOPERSIST)

      stop

      end subroutine plstop
