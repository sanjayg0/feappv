!$Id:$
      subroutine incom(pphi,shp,jacl, s)

      implicit   none

      include   'cdata.h'
      include   'eldata.h'
      include   'qudshp.h'
      include   'sdata.h'

!     Argument variables
      real (kind=8) :: jacl
      real (kind=8) :: pphi(*)
      real (kind=8) :: shp(ndm+1,*)
      real (kind=8) :: s(nst,nst)

!     Local variables
      integer       :: a,b, i
      real (kind=8) :: shpj

      save

!     Pressure tangent: Lagrange multiplier on elements
      do a = 1,nel
        do i = 1,ndm
          shpj = shp(i,a)*jacl
          do b = 1,npm
            s(sa(a)+i,ga+b) = s(sa(a)+i,ga+b) + shpj*pphi(b)
            s(ga+b,sa(a)+i) = s(ga+b,sa(a)+i) + shpj*pphi(b)
          end do ! b
        end do ! i
      end do ! a

      end subroutine incom
