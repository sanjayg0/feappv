!$Id:$
      subroutine uplot(ct)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2026: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose:

!      Inputs:

!      Outputs:
!-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      include  'iofile.h'

      real (kind=8) :: ct(3)

!     Remove following arguments when used in coding element
      if(.false.) write(iow,*) ct(1)

      write(*,*) ' *WARNING* No user plot available.'

      end subroutine uplot
