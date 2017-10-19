!$Id:$
      subroutine meshck(ip,ie,iedof,id,nty,ix,nie,nen,nen1,ndf,
     &                  numnp,numel,nummat,errs)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2017: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Perform check on mesh data to ensure nodes/elements input

!      Inputs:
!         ie(nie,*)        - Material set assembly information
!         iedof(ndf,nen,*) - Assembly information
!         id(ndf,*)        - Boundary condition and equation number array
!         nty(*)           - Nodal type
!         ix(nen1,*)       - Element nodal connection lists
!         nie              - Dimension of ie array
!         nen              - Maximum number of nodes/element
!         nen1             - Dimension for ix array
!         ndf              - Number dof/node
!         numnp            - Number of nodes in mesh
!         numel            - Number of elemenst in mesh
!         nummat           - Number of material sets

!      Outputs:
!         ip(ndf,*)        - List of active nodes, used for graphics
!         errs             - Flag, true if errors detected
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'cblend.h'
      include  'elflag.h'
      include  'iofile.h'
      include  'prflag.h'

      include  'pointer.h'
      include  'comblk.h'

      logical   errs
      integer   i,ii,j,ma,mg,n,nen,nen1,nie,ndf,numnp,numel,nummat

      integer   ip(ndf,*),  id(ndf,*), ie(nie,*), iedof(ndf,nen,*)
      integer   ix(nen1,*), nty(*)

      save

!     Perform mesh checks to ensure nodes/elements input

      errs = .false.
      do n = 1,numel
        if (ix(nen1,n).le.0 .or. ix(nen1,n).gt.nummat) then
          write(iow,2000) n
          if(ior.lt.0) write(*,2000) n
          errs = .true.
        else
          do i = 1,nen
            ii = ix(i,n)
            if(ii.gt.numnp .or. ii.lt.0) then
              write(iow,2001) ii,n
              if(ior.lt.0) write(*,2001) ii,n
              errs = .true.
            elseif(ii.ne.0 .and. nty(ii).lt.0) then
              write(iow,2002) ii,n
              if(ior.lt.0) write(*,2002) ii,n
              errs = .true.
            endif
          end do
        endif
      end do

!     Remove unused dof's using ie(nie,*) array

      do n = 1,numnp
        do j = 1,ndf
          ip(j,n) = 0
        end do ! j
      end do ! n

!     Check nodes on each element for active dof's

      do n = 1,numel
        mg = ix(nen1,n)

!       Loop over the material sets

        do ma = 1,nummat
          if(ie(nie-2,ma).eq.mg) then
            do i = 1,nen
              ii = ix(i,n)
              if(ii.gt.0) then
                do j = 1,ndf
                  if(iedof(j,i,ma).gt.0) then
                    ip(iedof(j,i,ma),ii) = 1
                  endif
                end do ! j
              endif
            end do ! i
          endif
        end do ! ma
      end do

!     Set b.c. restraints for unused dof's

      do n = 1,numnp
        do j = 1,ndf
          if(ip(j,n).eq.0) then
            id(j,n) = -1000
          end if
        end do ! j
      end do ! n

!     Remove unused nodes - for graphics

      do n = 1,numnp
        ip(1,n) = 0
      end do ! n

      do n = 1,numel
        do i = 1,nen
          ii = ix(i,n)
          if(ii.gt.0) ip(1,ii) = 1
        end do ! i
      end do ! n

!     Set flat to indicate node is not used

      do n = 1,numnp
        if(ip(1,n) .eq. 0) then
          nty(n) = -1
        end if
      end do

!     Fix all unspecified coordinate dof's

      do n = 1,numnp
        if(nty(n).lt.0) then
          do i = 1,ndf
            id(i,n) = 1
          end do
        endif
      enddo

!     If supernodes used then

      if(numbd.gt.0) then
        if(numsn.gt.0) then
          if(numsd.gt.0) then
            call mshcksn(mr(np(162)),mr(np(164)),numsd,numsn,numbd,errs)
          else
            write(iow,2003)
            if(ior.lt.0) write(*,2003)
            errs = .true.
          endif
        else
          write(iow,2004)
          if(ior.lt.0) write(*,2004)
          errs = .true.
        endif
      endif

!     Set first and last element numbers for each material type

      do ma = 1,min(80,nummat)
        do n = 1,numel
          if(ix(nen1,n).eq.ma) then
            elstart(ma) = n
            go to 100
          endif
        end do ! n
100     do n = numel,1,-1
          if(ix(nen1,n).eq.ma) then
            ellast(ma) = n
            go to 200
          endif
        end do ! n
200     continue
      end do ! ma

!     Compute nodal spacing data for tolerance use

      call phsize(hr(np(43)),hr(np(44)),mr(np(33)))

!     Formats

2000  format(10x,' *ERROR* Data for element ',i6,' not input')

2001  format(10x,' *ERROR* Data for node ',i6,' on element',i6,
     &           ' greater than maximum or negative')
2002  format(10x,' *ERROR* Data for node ',i6,' on element',i6,
     &           ' not input')

2003  format(10x,' *ERROR* Blending functions used but no SIDEs',
     &           ' exist')

2004  format(10x,' *ERROR* Blending functions used but no SNODes',
     &           ' exist')
      end

      subroutine mshcksn(is,iblend,numsd,numsn,numbd,errs)

      implicit  none

      include  'iofile.h'

      logical   errs
      integer   numsd,numsn,numbd,n,i,inc
      integer   is(16,numsd),iblend(21,numbd)

      save

!     Loop over SIDE nodes to check if any greater than number SNODes

      do n = 1,numsd
        if(is(1,n).eq.2) then
          inc = 2
        else
          inc = 1
        endif
        do i = 2,16,inc
          if(is(i,n).gt.numsn) then
            write(iow,2000) n, numsn, i
            errs = .true.
          endif
        end do ! i
      end do ! n

!     Loop over BLENd nodes to check if any greater than number SNODes

      do n = 1,numbd
        do i = 11,18
          if(iblend(i,n).gt.numsn) then
            write(iow,2001) n, numsn, i
            errs = .true.
          endif
        end do ! i
      end do ! n

!     Formats

2000  format(' *ERROR* SIDE',i5,' has value greater than maximum SNODE'
     &      ,' (',i5,') at entry',i5/)

2001  format(' *ERROR* BLENd',i5,' has value greater than maximum SNODE'
     &      ,' (',i5,') at entry',i5/)

      end
