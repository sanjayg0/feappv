!$Id:$
      subroutine seteq(id,ndf,ndm,numnp,neq,prt)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2017: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Set equation numbers for solution

!      Inputs:
!        id(ndf,*) - Boundary condition indicators
!        ndf       - Number dof/node
!        ndm       - Spatial dimension of problem
!        numnp     - Number of nodes in mesh
!        prt       - Flag, output results if true

!      Outputs:
!        id(ndf,*) - Equation numbers for each dof.  Active dof
!                    have positive numbers for equation, fixed
!                    dof have negative numbers
!        neq       - Number of active equations in problem
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'mxsiz.h'
      include  'pointer.h'
      include  'comblk.h'

      logical   prt
      integer   ndf,ndm,numnp,nad,neq,n,nn, i, j
      integer   id(ndf,numnp)

      save

!     Set equation numbers

      neq  = 0
      nad  = 0
      do n = 0,numnp-1
        nn = mr(np(89)+n)
        do i = 1,ndf
          j = id(i,nn)
          if(j.eq.0) then
            neq     = neq + 1
            id(i,nn) = neq
          else
            nad     = nad - 1
            id(i,nn) = nad
          endif
        end do
      end do

!     Link nodes from data

      if(lkflg) then
        call plink(id,hr(np(43)),ndm,ndf,numnp,neq,prt)
      endif

      end
