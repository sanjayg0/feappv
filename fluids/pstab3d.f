!$Id:$
      subroutine pstab3d(phi,shp,jac,lint,nel,npm,hh,gg,hg)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2024: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!     Modification log                                Date (dd/mm/year)
!       Original version                                    11/04/2018
!-----[--.----+----.----+----.-----------------------------------------]
!     Purpose: Pressure stabilizaton

!     Inputs:
!        phi(10,*)     - Stress functions
!        shp(4,125,*)  - Shape functions and derivatives
!        jac(*)       - Volume elements
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

      integer   lint,   nel,  npm,   i,j,l
      real*8    phi(10,*) ,  shp(4,125,*),  jac(*)
      real*8    gg(10,125),  hh(10,10) ,  hg(10,125)

      save

      hh(1:npm,1:npm) = 0.0d0
      gg(1:npm,1:nel) = 0.0d0

!     Quadrature loop
      do l = 1,lint
!       H-array and G-array
        do i = 1,npm
          hh(1:npm,i) = hh(1:npm,i) + phi(1:npm,l)*phi(i,l)*jac(l)
        end do ! i
        do i = 1,nel
          gg(1:npm,i) = gg(1:npm,i) + phi(1:npm,l)*shp(4,i,l)*jac(l)
        end do ! i
      end do ! l

!     write(  *,*) 'NPM=',npm,' HH=',hh(1,1),' GG=',gg(1,1), lint,nel
!     write(iow,*) 'NPM=',npm,' HH=',hh(1,1),' GG=',gg(1,1), lint,nel

!     Invert H-array
      if(npm.eq.1) then
        hh(1,1)    = 1.d0 / hh(1,1)
      else
        call invert(hh,npm,10)
      endif

!     Form H^-1 * G
      hg(1:npm,1:nel) = 0.0d0
      do i = 1,nel
        do j = 1,npm
          hg(1:npm,i) = hg(1:npm,i) + hh(1:npm,j)*gg(j,i)
        end do ! j
      end do ! i

      end subroutine pstab3d
