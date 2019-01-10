!$Id:$
      subroutine parstop()

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2019: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!     Modification log                                Date (dd/mm/year)
!       Original version                                    01/11/2006
!       1. Increase rbuf to 20 words                        20/01/2011
!       2. Set nrbuf to dsend + 7                           08/05/2012
!       3. Increase rbuf to 24 words                        20/)7/2012
!       4. Replace 'omacr1.h' by 'elpers.h'                 21/05/2013
!       5. Add check on mpiflg to stop MPI processes        30/05/2016
!       6. Change 'nrbuf' to 'nsbuf'; add prints on debug   24/01/2018
!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Close any open parallel array and delete memory use
!               Dummy routine in serial version.

!      Inputs:
!         none

!      Outputs:
!         none
!-----[--.----+----.----+----.-----------------------------------------]
      implicit   none

      include   'debugs.h'
      include   'elpers.h'
      include   'setups.h'
      include   'mpif.h'

      integer       :: i, ierr, nsbuf, usr_msg
      real (kind=8) :: rbuf(24)

      save

      data       rbuf / -999.0d0, 23*0.0d0 /
      data       usr_msg / 12 /

      if(debug) then
        call udebug(' parstop',0)
      endif

!     Close parallel arrays

      if(rank.eq.0) then
        nsbuf = dsend + 7
        do i = 1,ntasks - 1
          if(debug) then
            call udebug('     MPI_Send:Stop',usr_msg)
            write(*,*) 'PARSTOP:MPI_SSend:NSBUF,MSG',nsbuf,usr_msg
          endif
          call MPI_SSend(rbuf, nsbuf, MPI_DOUBLE_PRECISION, i, usr_msg,
     &                  MPI_COMM_WORLD, ierr)
        end do ! i
      endif

      if(mpiflg) then
        call MPI_Finalize( ierr )
      endif

      end subroutine parstop
