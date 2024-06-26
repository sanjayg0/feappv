!$Id:$
      subroutine mass2d(d,xl,ix,s,p,ndf,ndm,nst)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2024: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Compute mass matrix for plane and axisymmetric problems

!      Inputs:
!         d(*)      - Material set parameters
!         xl(ndm,*) - Nodal coordinates for element
!         ix(*)     - Element nodal connections
!         ndf       - Number dof/node
!         ndm       - Spatial dimension of mesh
!         nst       - Size of element arrays

!      Outputs:
!         s(nst,*)  - Consistent or interpolated mass
!         p(nst)    - Diagonal (lumped) mass
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'eldata.h'
      include  'fdata.h'
      include  'pmod2d.h'
      include  'qudshp.h'

      integer       :: ndf,ndm,nst
      integer       :: j,k,l,j1,k1

      real (kind=8) :: dv, aj1,xx,lfac,cfac

      integer       :: ix(*)
      real (kind=8) :: d(*),xl(ndm,*),s(nst,nst),p(nst)

      save

!     Set mass type
      if(fl(1)) then
        cfac = 1.0d0
      else
        cfac = 0.0d0
      endif
      lfac = 1.0d0 - cfac

!     Compute mass matrix
      call quadr2d(d,.false.)

      do l = 1,lint

!       Compute shape functions
        call interp2d( l, xl,ix, ndm,nel,.true.)
        dv = jac(l)*d(4)

        if(stype.eq.3) then
          xx = 0.0d0
          do j = 1,nel
            xx = xx + shp2(3,j,l)*xl(1,j)
          end do ! j
          dv = dv*xx
        end if

!       For each node j compute db = rho*shape*dv
        j1 = 1
        do j = 1,nel
          aj1 = shp2(3,j,l)*dv

!         Compute a lumped mass
          p(j1)    = p(j1  ) + aj1
          p(j1+1)  = p(j1+1) + aj1
          s(j1  ,j1  ) = s(j1  ,j1  ) + aj1*lfac
          s(j1+1,j1+1) = s(j1+1,j1+1) + aj1*lfac
          aj1      = aj1*cfac

!         For each node k compute mass matrix
          k1 = 1
          do k = 1,nel
            s(j1  ,k1  ) = s(j1  ,k1  ) + shp2(3,k,l)*aj1
            s(j1+1,k1+1) = s(j1+1,k1+1) + shp2(3,k,l)*aj1
            k1 = k1 + ndf
          end do
          j1 = j1 + ndf
        end do
      end do

      end subroutine mass2d
