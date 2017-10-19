!$Id:$
      subroutine slcn3d(sig,shp,xsj, p,s, lint,nel,nes)

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Project element variables to nodes

!      Inputs:
!        sig(6,*)     - Stresses at quadrature points
!        shp(4,nes,*) - Shape functions at quadrature points
!        xsj(*)       - Volume element at quadrature points
!        lint         - Number of quadrature points
!        nel          - Number nodes on element
!        nes          - Dimension of shape function array

!      Outputs:
!        p(nen)       - Weights for 'lumped' projection
!        s(nen,*)     - Integral of variables
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'cdata.h'
      include  'strnum.h'

      integer   ii, jj, l, lint, nel,nes
      real*8    p(*),s(nen,*), xsj(*),shp(4,nes,*),sig(6,*), xj

      save

!     Initialize the arrays

      do ii = 1,nel
        p(ii)    = 0.0d0
        do jj = 1,6
          s(ii,jj) = 0.0d0
        end do ! jj
      end do ! ii

!     Compute projections: int ( sig * shp(i) * darea )

      do l = 1,lint
        do ii = 1,nel
          xj    = xsj(l)*shp(4,ii,l)
          p(ii) = p(ii)   + xj
          do jj = 1,6
            s(ii,jj) = s(ii,jj) + sig(jj,l)*xj
          end do ! jj
        end do ! ii
      end do ! l

      end
