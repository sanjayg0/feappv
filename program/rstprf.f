!$Id:$
      subroutine rstprf(jp,idl,id,ix,ndf,nen1,nen,neq,numel)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2017: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Reset profile for elements

!      Inputs:
!         id(ndf,*)     - Equation numbers for nodal dof
!         ix(nen1,*)    - Element nodal connections
!         ndf           - Number dof/node
!         nen1          - Dimension for ix array
!         nen           - Number nodes connected to an element
!         neq           - Number of equations active
!         numel         - Number of elements in mesh

!      Scratch:
!         idl(*)        - Store element active equations, etc.

!      Outputs:
!         jp(*)         - Row/column lengths for each equation
!-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      include  'pointer.h'
      include  'comblk.h'

      integer   ndf,nen1,nen,neq,numel
      integer   i,j,ii, ma, mm, n,nad

      integer   jp(*),idl(*),id(ndf,*),ix(nen1,*)

!     Zero pointer array

      do n = 1,neq
        jp(n) = 0
      end do ! n

!     Compute column heights

      do n = 1,numel

!       Test for active element

        ma  = ix(nen1-1,n)
        if(ma.ge.0) then
          mm  = 0
          nad = 0
          do i = 1,nen
            ii = ix(i,n)

!           Set element profile

            if(ii.gt.0) then
              do j = 1,ndf
                if(id(j,ii).gt.0 ) then
                  if(mm.eq.0) mm = id(j,ii)
                  mm       = min(mm,id(j,ii))
                  nad      = nad + 1
                  idl(nad) = id(j,ii)
                end if
              end do
            endif
          end do

!         Compute column heights

          do i = 1,nad
            ii = idl(i)
            jp(ii) = max(jp(ii),ii-mm)
          end do
        end if
      end do

      end
