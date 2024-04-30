!$Id:$
      subroutine stream_2d(ul, p,s, nsr, isw)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2024: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!     Modification log                                Date (dd/mm/year)
!       Original version                                    27/04/2019
!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Streamline computation from velocities (2-d only)

!      Inputs:
!        ul(ndf,nen)   - Element velocities
!        nsr           - DOF for stream function
!        isw           - Compute tangent matrix if isw=3

!      Outputs:
!        p(ndf,nen)    - Residual for stream function
!        s(nst,nst)    - Tangent matrix for stream function
!-----[--.----+----.----+----.-----------------------------------------]
      implicit   none

      include   'cdata.h'
      include   'eldata.h'
      include   'sdata.h'
      include   'qudshp.h'

      include   'iofile.h'

      integer       :: isw
      integer       :: nsr
      real (kind=8) :: ul(ndf,nen)
      real (kind=8) :: p(ndf,nen)
      real (kind=8) :: s(nst,nst)

      integer       :: l,j,k
      real (kind=8) :: aj(2)
      real (kind=8) :: vel(2)
      real (kind=8) :: dpsi(2)

      save

!     Numerical integration loop
      do l = 1,lint

!       Velocity & gradient terms
        vel(1:2)  = 0.0d0
        dpsi(1:2) = 0.0d0
        do j = 1,nel
          vel(1:2)  = vel(1:2)  + ul(1:2,j)*shp2(3,j,l)
          dpsi(1:2) = dpsi(1:2) + ul(nsr,j)*shp2(1:2,j,l)
        end do ! j

!       Compute residual
        do j = 1,nel
          aj(1:2)  = shp2(1:2,j,l)*jac(l)
          p(nsr,j) = p(nsr,j) - aj(1)*(dpsi(1) - vel(2))
     &                        - aj(2)*(dpsi(2) + vel(1))
        end do ! j

!       Tangent stiffness computation
        if(isw.eq.3) then
          do j = 1,nel
            aj(1:2) = shp2(1:2,j,l)*jac(l)
            do k = 1,nel
              s(sa(j)+nsr,sa(k)+nsr) = s(sa(j)+nsr,sa(k)+nsr)
     &                               + aj(1)*shp2(1,k,l)
     &                               + aj(2)*shp2(2,k,l)
            end do ! k
          end do ! j

        end if ! isw.eq.3
      end do ! l

      end subroutine stream_2d
