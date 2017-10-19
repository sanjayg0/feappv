!$Id:$
      subroutine kine2m(shp,ul,f,df,ndf,nel,nen,detf,lint)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2017: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!     Purpose: Compute deformation gradient and its inverse at tn+1

!     Inputs:
!        shp(3,9,*)  - Shape functions and derivatives at gauss points
!        ul(ndf,*)   - Nodal solution parameters
!        ul(2,*)     - Nodal stress free reference displacements
!        ndf         - Number dof/node
!        nel         - Number nodes/element
!        nen         - Maximum number nodes/element
!        lint        - Number of quadrature points

!     Outputs:
!        f(9,*)      - Deformation gradient at gauss points
!        df(9,*)     - Incremental deformation gradient at points
!        detf(*)     - Determinant of deformation gradient at points
!-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      integer   ndf, nel,nen, lint, k, l

      real*8    shp(3,64,*),ul(ndf,nen,*)
      real*8    df(9,*),f(9,2,*),detf(2,*),finv(9),dfi(9)

      save

!     Compute deformation gradient at t-n+1

!        F**-1 = I - grad u

      do l = 1,lint
        do k = 1,8
          finv(k) = 0.0d0
        end do ! k
        finv(9) = 1.0d0

        do k = 1,nel
          finv(1) = finv(1) - ul(1,k,1)*shp(1,k,l)
          finv(2) = finv(2) - ul(2,k,1)*shp(1,k,l)
          finv(4) = finv(4) - ul(1,k,1)*shp(2,k,l)
          finv(5) = finv(5) - ul(2,k,1)*shp(2,k,l)
        end do ! k

        finv(1) = finv(1) + 1.0d0
        finv(5) = finv(5) + 1.0d0

!       F = ( F^-1)^-1

        detf(1,l) = 1.d0/(finv(1)*finv(5)-finv(2)*finv(4))

        f(1,1,l) = finv(5)*detf(1,l)
        f(2,1,l) =-finv(2)*detf(1,l)
        f(3,1,l) = 0.0d0
        f(4,1,l) =-finv(4)*detf(1,l)
        f(5,1,l) = finv(1)*detf(1,l)
        f(6,1,l) = 0.0d0
        f(7,1,l) = 0.0d0
        f(8,1,l) = 0.0d0
        f(9,1,l) =  1.0d0

!       Compute incremental deformation gradient

        dfi(1) = 0.0d0
        dfi(2) = 0.0d0
        dfi(4) = 0.0d0
        dfi(5) = 0.0d0
        do k = 1,nel
          dfi(1)   = dfi(1)   + ul(1,k,2)*shp(1,k,l)
          dfi(2)   = dfi(2)   + ul(2,k,2)*shp(1,k,l)
          dfi(4)   = dfi(4)   + ul(1,k,2)*shp(2,k,l)
          dfi(5)   = dfi(5)   + ul(2,k,2)*shp(2,k,l)
        end do
        df(1,l) = dfi(1)*f(1,1,l) + dfi(4)*f(2,1,l)
        df(2,l) = dfi(2)*f(1,1,l) + dfi(5)*f(2,1,l)
        df(3,l) = 0.0d0
        df(4,l) = dfi(1)*f(4,1,l) + dfi(4)*f(5,1,l)
        df(5,l) = dfi(2)*f(4,1,l) + dfi(5)*f(5,1,l)
        df(6,l) = 0.0d0
        df(7,l) = 0.0d0
        df(8,l) = 0.0d0
        df(9,l) = 0.0d0

!       Compute deformation gradient F_n

        f(1,2,l) = f(1,1,l) - df(1,l)
        f(2,2,l) = f(2,1,l) - df(2,l)
        f(3,2,l) = 0.0d0
        f(4,2,l) = f(4,1,l) - df(4,l)
        f(5,2,l) = f(5,1,l) - df(5,l)
        f(6,2,l) = 0.0d0
        f(7,2,l) = 0.0d0
        f(8,2,l) = 0.0d0
        f(9,2,l) = 1.0d0

        detf(2,l) = f(1,2,l)*f(5,2,l) - f(2,2,l)*f(4,2,l)

      end do ! l

      end
