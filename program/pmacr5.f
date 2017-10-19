!$Id:$
      subroutine pmacr5 (lct,ct,j)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2017: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!     Purpose: Command language instruction subprogram: Part 5

!     Inputs:
!        lct      - Command option for current command
!        ct(3)    - Command parameters for current command
!        j        - Number of command to execute

!     Outputs:
!        Depends on value of command j: None for serial version
!-----[--+---------+---------+---------+---------+---------+---------+-]
      implicit   none

      integer    j
      character  lct*15
      real*8     ct(3)

      save

!     Solution command instruction subprogram - part 5.

      if(j.eq.1) then

        write(*,2000) ' OUTMesh '

      endif

!     Formats

2000  format('  *ERROR*',a,'command only available in FEAP version')

      end
