!$Id:$
      subroutine setparam(par, value, prt)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2017: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Command language instruction subprogram: Part 6
!               Set parameter 'par' to 'value'.

!      Inputs:
!        par     - Parameter name to set
!        value   - Value to assign
!        prt     - Echo value set if true

!      Outputs:
!        none
!-----[--.----+----.----+----.-----------------------------------------]
      implicit   none

      include   'comfil.h'

      character  par*(*),name*15
      logical    prt, redo, pconset
      real*8     value

!     Put data into 'record'

      name   = par
      record = ' '
      record( 1:14) = name(1:14)
      record(15:15) = '='
      write(record(16:30),'(1p,1e15.7)') value

      redo = pconset(prt)

      end
