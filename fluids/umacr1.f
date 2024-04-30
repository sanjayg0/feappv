!$Id:$
      subroutine umacr1(lct,ctl)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2024: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!     Modification log                                Date (dd/mm/year)
!       Original version                                    01/11/2006
!       1. Remove 'prt' from argument list                  09/07/2009
!       2. Add 'uhelpfl' comment option                     19/10/2017
!       3. Add 'help' comment option - replaces 'uhelpfl'   07/01/2019
!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Set midside nodes for graphics

!      Inputs:
!         lct       - Command character parameters
!         ctl(3)    - Command numerical parameters

!      Outputs:
!         N.B.  Users are responsible for command actions.  See
!               programmers manual for example.
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'iofile.h'
      include  'umac1.h'
      include  'cdata.h'
      include  'sdata.h'
      include  'pointer.h'

      include  'comblk.h'
      logical   pcomp
      character lct*15
      real*8    ctl(3)

      save

!     Set command word

      if(pcomp(uct,'mac1',4)) then      ! Usual    form
        uct = 'midnd'                   ! Specify 'name'
        write(*,2000)

      elseif(pcomp(lct,'help',4)) then  ! Write help information

        write(*,*) 'MIDND: Use elements to set midside nodal values'

      elseif(urest.eq.1) then           ! Read  restart data

      elseif(urest.eq.2) then           ! Write restart data

      else                              ! Perform user operation

        call p_midnd_set(hr(np(40)), mr(np(33)))

      endif

!     Formats

2000  format('  *USER COMMAND* Command MIDNd installed (isw=31)')

      end subroutine umacr1
