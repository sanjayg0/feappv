!$Id:$
      logical function ualloc(num,name,length,precis)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2017: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Define, delete, or resize a user dictionary entry.
!               Pointer defined for integer (single) and real
!               (double precision) arrays.

!               N.B. Currently limited to 200 names by dimension of
!               common blocks 'allotd','allotn','pointer'

!      Inputs:

!         num        - Entry number for array (see below)
!         name       - Name of array          (see below)
!         length     - Length of array defined: =0 for delete
!         precis     - Precision of array: 1 = integers; 2 = reals

!      Output:

!         up(num)    - Pointer to first word of array in blank common
!-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      include  'allotd.h'

      logical   usetmem
      character name*(*)
      integer   i, num, precis
      integer   length

!     Storage definitions for UALLOC variables

      integer   list
      parameter (list = 1)

      character names(list)*5

      save

!     Define and store names

      data   (names(i),i=1,list)/

     &         'DUMMY'/

!     Short description of variables

!              'DUMMY',     !     1: Start here with user defined names

!     Do memory management operations

      ualloc = usetmem(list,names,num,name,length,precis)

      end
