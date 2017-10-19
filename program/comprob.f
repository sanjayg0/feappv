!$Id:$
      subroutine comprob(numnp, nen, nen1, ndf, ix, id,
     &                   ic, ielc, ir, jc, bycol, wdiag, all)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2017: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose:  Compute locations for non-zero terms in coefficient
!                matrix.

!      Inputs:
!         numnp      -  Number of nodes in mesh
!         nen        -  Maximum number of nodes on any element
!         nen1       -  Dimension for 'ix' array
!         ndf        -  Number of unknowns at each node.
!         ix(nen1,*) -  List of nodes connected to each element
!         id         -  Active unknowns at each node.
!         ic         -  Pointer for ielc list
!         ielc(*)    -  Holds set of elements connected to each node.
!         bycol      -  Storage by columns if true
!         wdiag      -  Include diagonal if true
!         all        -  All terms in row/col if true

!      Outputs:
!         ir(*)      -  Row number of each nonzero in stiffness matrix.
!         jc(*)      -  End of enteries in ir from a given column.
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'compac.h'
      include  'pointer.h'
      include  'comblk.h'

      logical   bycol, wdiag, all
      integer   i, j, k, ne, nep, neq, nn
      integer   numnp, nen, nen1, ndf, kp, kpo
      integer   ix(nen1,*), id(ndf,*), ic(*), ir(*), ielc(*), jc(*)

      save

!     Set up compressed profile pointers.

      neq = 0
      do i = 1, numnp
        do j = 1,ndf
          neq = max(neq,id(j,i))
        end do ! j
      end do ! i

!     Do all equations

      kp  = 0
      nep = 1
      do i = 1, neq
        ne    = ic(i)
        jc(i) = kp
        kpo   = kp + 1
        do k = nep, ne
          nn = ielc(k)

!         Check element type(>0: FE, <0: contact)

          if(nn.gt.0) then
            call comelm(id,ix(1,nn), ir, ndf,nen,  kpo,kp,i,
     &                  bycol,wdiag,all)
          endif

!         End element tests

        end do ! k
        jc(i) = kp
        nep   = ne + 1
      end do ! i

      end
