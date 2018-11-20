
      subroutine pfe2setu(elnk,x,u)

!-----[--.----+----.----+----.-----------------------------------------]
!     Purpose: Set boundary displacement values from input values

!     Inputs:
!         prtype          - Problem type
!         elnk(ndf,numnp) - Linked edge indicators
!         x(ndm,numnp)    - Nodal coordinates

!     Outputs:
!         u(ndf,numnp,*)  - Displacements at nodes
!-----[--.----+----.----+----.-----------------------------------------]
      implicit   none

      include   'cdata.h'                 ! numnp,numel
      include   'elpers.h'                ! gradu(3,3)
      include   'sdata.h'                 ! ndm,ndf

      integer    elnk(ndf,numnp)
      real*8     x(ndm,numnp), u(ndf,numnp,*)
      real*8     ulnk(3)

      integer    i,j,n, e, it

      save

!     Compute linking incremental temperatures

      if(prtype.eq.1 .or. prtype.eq.3) then

        if(prtype.eq.1) then
          it = 1
        else
          it = ndm + 1
        endif

!       Loop over linked nodes to set temperature

        do n = 1,numnp
          ulnk(it)  = 0.0d0
          u(it,n,4) = 0.0d0
          e = elnk(it,n)
          if(e.gt.0) then        ! Node n is linked to node elnk(j,n)
            do i = 1,ndm
              ulnk(it) = ulnk(it) + gradt(i)*(x(i,n) - x(i,e))
            end do ! k
            u(it,n,4) = (u(it,e,1) - u(it,n,1)) + ulnk(it)
          endif
        end do ! n

      endif

!     Compute linking incremental displacements

      if(prtype.eq.2 .or. prtype.eq.3) then

!       Loop over linked nodes to set displacements

        do n = 1,numnp
          do j = 1,ndm
            ulnk(j)  = 0.0d0
            u(j,n,4) = 0.0d0
          end do ! j
          do j = 1,ndm
            e = elnk(j,n)
            if(e.gt.0) then        ! Node n is linked to node elnk(j,n)
              do i = 1,ndm
                ulnk(j) = ulnk(j) + gradu(j,i)*(x(i,n) - x(i,e))
              end do ! k
              u(j,n,4) = (u(j,e,1) - u(j,n,1)) + ulnk(j)
            endif
          end do ! j

        end do ! n

      endif ! prtype

      end subroutine pfe2setu
