!$Id:$
      subroutine shp1d(s,xl,shp,ndm,nel,xjac)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2024: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!     Purpose: Compute shape functions, natural derivatives, and
!              jacobian for 3-D line at natural coordinate s.
!              Linear (2 nodes) or quadratic (3 nodes) element.

!     Inputs:
!       s         : natural coordinate
!       xl(3,nel) : nodal global coordinates
!       ndm       : coordinate dimension of mesh
!       nel       : number of nodes of element

!     Outputs:
!       shp(2,nel): shape functions and derivatives at s
!                   shp(1,1 to nel): derivatives of shape functions
!                   shp(2,1 to nel): shape functions
!       xjac      : jacobian at s
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'iofile.h'

      integer       :: ndm,nel,i,j
      real (kind=8) :: s,xjac, dxi
      real (kind=8) :: xl(ndm,nel),shp(2,nel)

      save

!     Linear element
      if(nel.eq.2) then

        shp(1,1) = -0.50
        shp(1,2) =  0.50

        shp(2,1) = (1.d0 - s)*0.5d0
        shp(2,2) = (1.d0 + s)*0.5d0

!     Quadratic element
      elseif(nel.eq.3) then

!       Shape function natural derivatives
        shp(1,1) =  s - 0.5d0
        shp(1,2) =  s + 0.5d0
        shp(1,3) = -s*2.d0

        shp(2,1) =  s*(s - 1.d0)*0.5d0
        shp(2,2) =  s*(s + 1.d0)*0.5d0
        shp(2,3) =  1.d0 - s*s

      endif

!     Convert local derivatives to global ones
      xjac = 0.0d0
      do j = 1,ndm
        dxi = 0.0d0
        do i = 1,nel
          dxi = dxi + shp(1,i)*xl(j,i)
        end do ! i
        xjac = xjac + dxi*dxi
      end do ! j
      if(xjac.eq.0.d0) then
        write(iow,3000) xjac
        call plstop(.true.)
      else
        xjac = sqrt(xjac)
      endif

!     Compute coordinate derivatives
      do i = 1,nel
        shp(1,i) = shp(1,i)/xjac
      end do ! i

!     Format

3000  format(/5x,'Error in SHP1D: |J| =',1p,1d12.5/
     &       /5x,'Element has zero jacobian')

      end subroutine shp1d
