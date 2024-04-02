!$Id:$
      subroutine ale_elas(d,eps,veps,  sig, dd)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2024: Regents of the University of California
!                               All rights reserved
!-----[--.----+----.----+----.-----------------------------------------]
!     Modification log                                Date (dd/mm/year)
!       Original version                                    02/04/2018
!-----[--.----+----.----+----.-----------------------------------------]
!     Purpose: ALE Incremental elastic behavior
!     Inputs:
!       d(*)        - Material paramters
!       eps(6)      - Deviatoric strain rate
!       veps        - Volumetric strain rate

!     Outputs:
!       sig(6)      - Stress
!       dd(6,6)     - Material tangent
!-----[--.----+----.----+----.-----------------------------------------]
      implicit    none

      include    'pconstant.h'

      real (kind=8) :: d(*)
      real (kind=8) :: eps(6), veps
      real (kind=8) :: sig(6)
      real (kind=8) :: dd(6,6)

      real (kind=8) :: mu, mu2, lam
      integer       :: i

      real (kind=8) :: one3,two3
      parameter(one3 = 1.0d0/3.0d0)
      parameter(two3 = 2.0d0/3.0d0)

      save

!     Set stress
      lam      = d(21)
      mu       = d(22)
      mu2      = mu*2.0d0
      sig(1:3) = lam*veps + (eps(1:3) - one3*veps)*mu2
      sig(4:6) = eps(4:6)*mu

!     Set tangent
      dd(1:3,1:3) = lam - mu*two3
      do i = 1,3
        dd(i,i) = dd(i,i) + mu2
      end do ! i
      do i = 4,6
        dd(i,i) = mu
      end do ! i

      end subroutine ale_elas
