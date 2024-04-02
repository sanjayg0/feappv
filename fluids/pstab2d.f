!$Id:$
      subroutine pstab2d(phi,shp,jac,lint,nel,npm,hh,gg,hg)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2024: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!     Modification log                                Date (dd/mm/year)
!       Original version                                    11/04/2018
!       1. Add direct coding for npm = 1 & 3                13/01/2019
!-----[--.----+----.----+----.-----------------------------------------]
!     Purpose: Pressure stabilizaton

!     Inputs:
!        phi(10,*)     - Stress functions
!        shp(3,64,*)   - Shape functions and derivatives
!        jac(*)        - Volume elements
!        lint          - Number of quadrature points
!        nel           - Number of nodes on element
!        npm           - Number of pressure modes

!     Outputs:
!        hh(10,10)     - Volume/pressure shape integrals (inverse)
!        gg(10,*)      - Volume/pressure shape integrals (inverse)
!        hg(10,*)      - Volume/pressure shape integrals (inverse)
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'iofile.h'

      integer       :: lint,   nel,  npm,   i,j,l
      real (kind=8) :: phi(10,*),  shp(3,64,*),  jac(*)
      real (kind=8) :: gg(10,64),  hh(10,10)  ,  hg(10,64)

      save

!     Initialize arrays
      hh(1:npm,1:npm) = 0.0d0
      gg(1:npm,1:nel) = 0.0d0

!     Quadrature loop
      do l = 1,lint
!       H-array and G-array
        do i = 1,npm
          hh(1:npm,i) = hh(1:npm,i) + phi(1:npm,l)*phi(i,l)*jac(l)
        end do ! i
        do i = 1,nel
          gg(1:npm,i) = gg(1:npm,i) + phi(1:npm,l)*shp(3,i,l)*jac(l)
        end do ! i
      end do ! l

!     write(  *,*) 'NPM=',npm,' HH=',hh(1,1),' GG=',gg(1,1), lint,nel
!     write(iow,*) 'NPM=',npm,' HH=',hh(1,1),' GG=',gg(1,1), lint,nel

!     Invert H-array
      if(npm.eq.1) then
        hh(1,1)     = 1.d0 / hh(1,1)
        hg(1,1:nel) = hh(1,1)*gg(1,1:nel)
      elseif(npm.eq.3) then
        call invert(hh,npm,10)
        do i = 1,npm
          hg(i,1:nel) = hh(i,1)*gg(1,1:nel)
     &                + hh(i,2)*gg(2,1:nel)
     &                + hh(i,3)*gg(3,1:nel)
        end do ! i
      else
        call invert(hh,npm,10)

!       Form H^-1 * G
        hg(1:npm,1:nel) = 0.0d0
        do i = 1,nel
          do j = 1,npm
            hg(1:npm,i) = hg(1:npm,i) + hh(1:npm,j)*gg(j,i)
          end do ! j
        end do ! i
      endif

      end subroutine pstab2d
