!$Id:$
      subroutine ufe2opar(n_rve,rank,oper,isw)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2018: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!     Modification log                                Date (dd/mm/year)
!       Original version                                    07/02/2018
!-----[--.----+----.----+----.-----------------------------------------]

!     Purpose: User function for FE2

!     Inputs:
!       n_rve      - Number of RVE model
!       rank       - Rank of current process
!       opar(*)    - Parameter values

!     Outputs:
!       User choice
!-----[--.----+----.----+----.-----------------------------------------]
      implicit         none

      integer       :: n_rve    ! RVE number
      integer       :: rank     ! Processor number
      integer       :: isw      ! Switch: 1 = initialize, 2 = compute
      real (kind=8) :: oper(2)

      end subroutine ufe2opar
