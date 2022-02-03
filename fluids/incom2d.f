!$Id:$
      subroutine incom2d(pphi,shp,jacl,ppress,theta, s,p)

      implicit   none

      include   'cdata.h'
      include   'eldata.h'
      include   'qudshp.h'
      include   'sdata.h'

!     Argument variables

!     integer       :: nmp, nel
      real (kind=8) :: jacl
      real (kind=8) :: ppress,theta
      real (kind=8) :: pphi(*)
      real (kind=8) :: shp(3,*)
      real (kind=8) :: s(nst,nst)
      real (kind=8) :: p(nst)

!     Local variables

      integer       :: a,b, i
      real (kind=8) :: shpj

      do a = 1,nel
        do i = 1,ndm
          shpj = shp(i,a)*jacl
          do b = 1,npm
            s(sa(a)+i,ga+b) = s(sa(a)+i,ga+b) + shpj*pphi(b)
            s(ga+b,sa(a)+i) = s(ga+b,sa(a)+i) + shpj*pphi(b)
          end do ! b
          p(sa(a)+i) = p(sa(a)+i) - shpj*ppress
        end do ! i
      end do ! a

      do b = 1,npm
        p(ga+b) = p(ga+b) - pphi(b)*theta*jacl
      end do ! b

      end subroutine incom2d
