!$Id:$
      subroutine ckbrkq ( n, ix, xl, ndm, nel, shp )

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2024: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!     Modification log                                Date (dd/mm/year)
!       Original version                                    01/11/2006
!       1. Add check on 20-node hexagonal elements          06/04/2018
!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Check 20-node & 27-node brick for bad data.
!               Write message to file on errors located.

!      Inputs:
!         n         - Number of element being checked
!         ix(*)     - List of nodes for element
!         xl(ndm,*) - Coordinate array
!         ndm       - Spatial dimension of mesh
!         nel       - Number of nodes on element

!      Outputs:
!         None

!      Scratch:
!         shp(*)    - Array to store shape functions
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'fdata.h'
      include  'iofile.h'
      include  'pointer.h'
      include  'comblk.h'

      integer       :: ndm, nel, i, l, n, ineg, ix(*), ic(54)
      real (kind=8) :: detj, rst(3,27), xl(ndm,*), shp(*)

      save

      data      rst/-1.d0,-1.d0,-1.d0,   1.d0,-1.d0,-1.d0,
     &               1.d0, 1.d0,-1.d0,  -1.d0, 1.d0,-1.d0,
     &              -1.d0,-1.d0, 1.d0,   1.d0,-1.d0, 1.d0,
     &               1.d0, 1.d0, 1.d0,  -1.d0, 1.d0, 1.d0,
     &               0.d0,-1.d0,-1.d0,   1.d0, 0.d0,-1.d0,
     &               0.d0, 1.d0,-1.d0,  -1.d0, 0.d0,-1.d0,
     &               0.d0,-1.d0, 1.d0,   1.d0, 0.d0, 1.d0,
     &               0.d0, 1.d0, 1.d0,  -1.d0, 0.d0, 1.d0,
     &              -1.d0,-1.d0, 0.d0,   1.d0,-1.d0, 0.d0,
     &               1.d0, 1.d0, 0.d0,  -1.d0, 1.d0, 0.d0,
     &               0.d0, 0.d0,-1.d0,   0.d0, 0.d0, 1.d0,
     &              -1.d0, 0.d0, 0.d0,   1.d0, 0.d0, 0.d0,
     &               0.d0,-1.d0, 0.d0,   0.d0, 1.d0, 0.d0,
     &               0.d0, 0.d0, 0.d0/

!     Check element for input errors

      ineg = 0
      do l = 1,nel
        if(ix(l).gt.0) then
          if(mr(npty+ix(l)-1).lt.0) then
            ic(ineg+1) = l
            ic(ineg+2) = abs(ix(l))
            ineg = ineg + 2
          endif
        endif
      end do ! l

!     Node numbering errors

      if(ineg.gt.0) then
        write(iow,2000) n,(ic(i),i=1,ineg)
        if(ior.lt.0) write(*,2000) n,(ic(i),i=1,ineg)

!     Compute jacobian at each node of element

      else
        ineg = 0
        do l = 1,nel
          if(nel.eq.27) then
            call shp3dq ( rst(1,l) , shp )
            call bjac3dq( shp, xl, ndm, nel, detj)
          else
            call shp3d( rst(1,l), detj, shp, xl, ndm, nel)
          endif
          if(detj.le.0.0d0) then
            ic(ineg+1) = l
            ic(ineg+2) = abs(ix(l))
            ineg = ineg + 2
          endif
        end do ! l
        if(ineg.gt.0 .and. pfr) then
          write(iow,2001) n,(ic(i),i=1,ineg)
          if(ior.lt.0) write(*,2001) n,(ic(i),i=1,ineg)
        endif
      endif

2000  format(' >Element',i9,' coordinates not input for nodes:'/
     &      ('                Local =',i3,' Global =',i9))

2001  format(' >Element',i9,' has negative jacobian at nodes:'/
     &      ('                Local =',i3,' Global =',i9))

      end subroutine ckbrkq
