!$Id:$
      subroutine flcn2d(sig,pr,ev,p,s,nel,nes)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2024: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!     Modification log                                Date (dd/mm/year)
!       Original version                                    28/01/2019
!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Project element variables to nodes

!      Inputs:
!        sig(nes,*) - Stresses  at quadrature points
!        pr(     *) - Pressure  at quadrature points
!        ev(     *) - Divergence of velocity at quadrature points
!        nel        - Number nodes on element
!        nes        - Dimension of stress array

!      Outputs:
!        p(nen)     - Weights for 'lumped' projection
!        s(nen,*)   - Integral of variables
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'cdata.h'
      include  'sdata.h'
      include  'prstrs.h'
      include  'strnum.h'
      include  'pconstant.h'
      include  'pointer.h'
      include  'qudshp.h'
      include  'comblk.h'

!     Argument variables
      integer       :: nel,nes
      real (kind=8) :: p(*),s(nen,*),sig(nes,*),pr(*),ev(*)

!     Local variables
      integer       :: i,j,l
      real (kind=8) :: xg
      real (kind=8) :: sigg(6,16),preg(16),eveg(16)

      save

!     Local least squares projection

!     Initial least squares arrays
      matnp(1:nel,1:nel) = 0.0d0
      sigg(:,1:nel)    = 0.0d0
      preg(  1:nel)    = 0.0d0
      eveg(  1:nel)    = 0.0d0
!     Loop over quadrature points
      do l = 1,lint
        do i = 1,nel
          xg = shp2(3,i,l)*jac(l)
          do j = 1,nel
            matnp(i,j) = matnp(i,j) + shp2(3,j,l)*xg
          end do ! j
          sigg(1:6,i) = sigg(1:6,i) + sig(1:6,l)*xg
          preg(    i) = preg(    i) + pr(l)*xg
          eveg(    i) = eveg(    i) + ev(l)*xg
        end do ! i
      end do ! l
      call invert(matnp,nel,125)

!     Stress projections
      do j = 1,6
        prjnp(:) = 0.0d0
        do i = 1,nel
            prjnp(1:nel) = prjnp(1:nel) + matnp(1:nel,i)*sigg(j,i)
        end do ! i
        s(1:nel,j) = prjnp(1:nel)
      end do ! j

!     Pressure projections
      prjnp(:) = 0.0d0
      do i = 1,nel
        prjnp(1:nel) = prjnp(1:nel) + matnp(1:nel,i)*preg(i)
      end do ! i
      s(1:nel,7) = prjnp(1:nel)

!     Continuity projections
      prjnp(:) = 0.0d0
      do i = 1,nel
        prjnp(1:nel) = prjnp(1:nel) + matnp(1:nel,i)*eveg(i)
      end do ! i
      s(1:nel,8) = prjnp(1:nel)

!     Set average weight
      p(1:nel) = 1.0d0

      iste = 8

      end subroutine flcn2d
