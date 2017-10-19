!$Id:$
      subroutine addext(fnam,fext,ifnam,ifext)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2017: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose:       Add extender to file name for disk i/o

!      Inputs:
!        fname(*)   - File name without extender
!        fext(*)    - Extender
!        ifnam      - Length of 'fname'
!        ifext      - Length of 'fext'

!      Outputs:
!        fname(*)   - File name with added  '.' and 'fext'
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      integer   ipos, iposl, iposx, ifnam,ifext
      character fnam*(*),fext*(*)

      iposl = ipos(fnam,ifnam) + 1
      iposx = ipos(fext,ifext)

      fnam(iposl:ifnam)         = '. '
      fnam(iposl+1:iposl+iposx) = fext(1:iposx)

      end
