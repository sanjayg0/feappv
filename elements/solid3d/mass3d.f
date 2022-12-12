!$Id:$
      subroutine mass3d(d,xl,s,p,ndf,ndm,nst)

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Compute mass matrix for 3-d tet and brick elements

!      Inputs:
!         d(*)      - Material set parameters
!         xl(ndm,*) - Nodal coordinates for element
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

      logical       :: quad
      integer       :: ndf,ndm,nst
      integer       :: j,k,l,j1,k1,lint

      real (kind=8) :: xsj,dv, aj1,lfac,cfac

      real (kind=8) :: d(*),xl(ndm,*),s(nst,nst),p(nst)
      real (kind=8) :: shp(4,8),sg(4,8),sv(5,4)

      save

!     Set mass type
      if(fl(1)) then
        cfac = 1.0d0
      else
        cfac = 0.0d0
      endif
      lfac = 1.0d0 - cfac

!     Compute mass matrix
      if(nel.eq.4) then
        l    =  2
        quad = .false.
        call tint3d(l,lint,sv)
      else
        l    = nint(d(5))
        quad = .true.
        call int3d(l,lint,sg)
      endif

!     Comute consistent & lumped mass
      do l = 1,lint

!       Compute shape functions
        if(quad) then
          call shp3d(sg(1,l),xsj,shp,xl,ndm)
          dv = sg(4,l)*xsj*d(4)
        else
          call tetshp(sv(1,l),xl,ndm,xsj,shp)
          dv = sv(5,l)*xsj*d(4)
        endif

!       For each node j compute db = rho*shape*dv
        j1 = 1
        do j = 1,nel
          aj1 = shp(4,j)*dv

!         Compute a lumped mass
          p(j1  )      = p(j1  )    + aj1
          p(j1+1)      = p(j1+1)    + aj1
          p(j1+2)      = p(j1+2)    + aj1
          s(j1  ,j1  ) = s(j1  ,j1  ) + aj1*lfac
          s(j1+1,j1+1) = s(j1+1,j1+1) + aj1*lfac
          s(j1+2,j1+2) = s(j1+2,j1+2) + aj1*lfac
          aj1      = aj1*cfac

!         For each node k compute mass matrix
          k1 = 1
          do k = 1,nel
            s(j1  ,k1  ) = s(j1  ,k1  ) + shp(4,k)*aj1
            s(j1+1,k1+1) = s(j1+1,k1+1) + shp(4,k)*aj1
            s(j1+2,k1+2) = s(j1+2,k1+2) + shp(4,k)*aj1
            k1 = k1 + ndf
          end do
          j1 = j1 + ndf
        end do
      end do

      end subroutine mass3d
