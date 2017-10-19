!$Id:$
      subroutine mass2d(d,xl,ix,s,p,ndf,ndm,nst)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2017: Regents of the University of California
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
      include  'pmod2d.h'

      logical   quad
      integer   ndf,ndm,nst
      integer   j,k,l,j1,k1,lint

      real*8    xsj,dv, aj1,xx,lfac,cfac

      integer   ix(*)
      real*8    d(*),xl(ndm,*),s(nst,nst),p(nst)
      real*8    shp(3,9),sg(3,16),el(4,7)

      save

!     Compute mass matrix

      if(nel.eq.6 .or. nel.eq.7) then
        l    =  7
        quad = .false.
        call tint2d(l,lint,el)
      else
        l    = nint(d(5))
        quad = .true.
        if(l*l.ne.lint) call int2d(l,lint,sg)
      endif
      cfac = d(7)
      lfac = 1.d0 - cfac

      do l = 1,lint

!       Compute shape functions

        if(quad) then
          call shp2d(sg(1,l),xl,shp,xsj,ndm,nel,ix,.false.)
          dv = sg(3,l)*abs(xsj)*d(4)
        else
          call trishp(el(1,l),xl,ndm,nel-4,xsj,shp)
          dv = el(4,l)*abs(xsj)*d(4)
        endif
        if(stype.eq.3) then
          xx = 0.0d0
          do j = 1,nel
            xx = xx + shp(3,j)*xl(1,j)
          end do ! j
          dv = dv*xx
        end if

!       For each node j compute db = rho*shape*dv

        j1 = 1
        do j = 1,nel
          aj1 = shp(3,j)*dv

!         Compute a lumped mass

          p(j1)    = p(j1) + aj1
          s(j1,j1) = s(j1,j1) + aj1*lfac
          aj1      = aj1*cfac

!         For each node k compute mass matrix (upper triangular part)

          k1 = j1
          do k = j,nel
            s(j1,k1) = s(j1,k1) + shp(3,k)*aj1
            k1 = k1 + ndf
          end do
          j1 = j1 + ndf
        end do
      end do

!     Compute missing parts and lower part by symmetries

      do j = 1,ndf*nel,ndf
        p(j+1) = p(j)
        do k = j,ndf*nel,ndf
          s(j+1,k+1) = s(j,k)
          s(k  ,j  ) = s(j,k)
          s(k+1,j+1) = s(j,k)
        end do
      end do

      end
