!$Id:$
      subroutine elcnt(numnp, numel, nen, neix, ix, ic,  flag)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2017: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Compute array for performing assembly of stiffness
!               matrices into a compacted data structure;

!      Inputs:
!          numnp  -  Number of nodes in the mesh.
!          numel  -  Number of elements in the mesh.
!          nen    -  Max. number of nodes per element.
!          neix   -  Dimension of ix array.
!          ix     -  Element conectivity array.

!      Outputs:
!          ic     -  Array of length numnp.  It first holds the
!                    element degree of each node, then becomes a
!                    pointer for an array that contains the set
!                    of elements connected to each node.
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'comblk.h'
      include  'pointer.h'
      include  'sdata.h'

      logical   flag
      integer   i,j,k,n
      integer   numnp, numel, nen, neix
      integer   ix(neix, *), ic(*), nty

      save

!     Count number of elements attached to each node.

      if(flag) call pzeroi(ic, numnp*ndf)
      do i = 1, numel
        do j =  1, nen
          n = ix(j,i)
          if(n.gt.0) then
            do k = 1,ndf
              nty = mr(np(31) + ndf*n - ndf + k -1)
              if(nty.gt.0) ic(nty) = ic(nty) + 1
            end do ! k
          end if ! n > 0
        end do
      end do

      end

      subroutine sumcnt(ic,nneq,kp)

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Sum counts to get storage of connections

!      Inputs:
!          ic(*)  - Array of 'heights'
!          nneq   - Number of entries

!      Outputs:
!          ic(*)  - Pointer array
!          kc     - Length of pointer array
!-----[--.----+----.----+----.-----------------------------------------]
      implicit   none
      integer    i,kp,nneq,ic(*)

!     Set up pointers.

      do i = 2, nneq
         ic(i) = ic(i) + ic(i-1)
      end do
      kp = ic(nneq)

      end
