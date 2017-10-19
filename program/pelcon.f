!$Id:$
      subroutine pelcon(numel, nen, neix, ix, ic, ielc, icneq, sgn)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2017: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose:  Compute number of elements connected to each node
!                matrix.

!      Inputs:
!         numel      -  Number of elements in mesh
!         nen        -  Maximum number of nodes on any element
!         neix       -  Dimension for 'ix' array
!         ix(nen1,*) -  List of nodes connected to each element
!         icneq      -  Dimension of IELC (= ic(neq))
!         ic(*)      -  Pointer array

!      Outputs:
!         ielc(*)    -  Holds the set of elements connected to each node.
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'comblk.h'
      include  'pointer.h'
      include  'sdata.h'

      integer   i, j,k, n
      integer   icneq, numel, nen, neix, kp, sgn
      integer   ix(neix,*), ic(*), ielc(*), nty

      save

!     Find elements connected to each node

      if(sgn.gt.0) call pzeroi(ielc, icneq)

      do i = 1, numel
        do j = 1, nen
          n = ix(j,i)
          if(n.gt.0) then
            do k = 1,ndf
              nty = mr(np(31) + n*ndf - ndf + k - 1)
              if(nty.gt.0) then
                kp = ic(nty)
100             if(ielc(kp).eq.0) go to 110
                kp = kp - 1
                go to 100
110             if(sgn.gt.0) then
                  ielc(kp) =  i
                else
                  ielc(kp) = -i
                endif
              endif ! nty > 0
            end do ! k
          endif ! n > 0
        end do ! j
      end do ! i

      end
