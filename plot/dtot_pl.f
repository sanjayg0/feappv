!$Id:$
      subroutine dtot_pl(u,utot, k1)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2024: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!     Modification log                                Date (dd/mm/year)
!       Original version                                    13/09/2021
!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Displacement resultant between dof = 1,k1

!      Inputs:
!         u(ndf,numnp)     - Displacement
!         k1               - dof range

!      Outputs:
!         utot(ndf,numnp0  - Resultant
!-----[--.----+----.----+----.-----------------------------------------]
      implicit   none

      include   'cdata.h'
      include   'sdata.h'

      integer       :: k1
      real (kind=8) :: u(ndf,numnp)
      real (kind=8) :: utot(ndf,numnp)

      integer       :: n, k
      real (kind=8) :: uval

!     Loop over nodes
      do n = 1,numnp
        uval = 0.0d0
        do k = 1,k1
          uval = uval + u(k,n)**2
        end do ! k
        uval      = sqrt(uval)
        utot(:,n) = uval
      end do ! n

      end subroutine dtot_pl
