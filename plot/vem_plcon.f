!$Id:$
      subroutine vem_plcon(k, nc, nel, xl, iplt, icl, v, vc, cont)

      implicit   none

      include   'iofile.h'

      logical       :: cont
      integer       :: k, nc,nel
      integer       :: iplt(*), icl(*)
      real (kind=8) :: xl(3,*), v(*), vc(*)

!     Remove following arguments when used in coding element
      if(.false.) write(iow,*) k,nc,nel,xl(1,1),iplt(1),icl(1),v(1),
     &                         vc(1),cont

      write(*,*) ' This option is available only in the VEM version'

      end subroutine vem_plcon
