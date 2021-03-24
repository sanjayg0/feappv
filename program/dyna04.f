!$Id:$
      subroutine dyna04(du,urate,nneq,isw)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2021: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Static, 1st order ODE integration by backward Euler
!               method.

!      Notes: 1. Values of velocity and acceleration are returned as
!                zero for values of ndo(i) .gt. order specified.

!      Inputs:
!         du(*)             Increment to displacement
!         urate(nneq,*)     Rate vectors - fixed by ALGO
!         nneq              numnp * ndf
!         isw               Control switch
!                            1  STARTING update: begining of time step
!                            2  UPDATE at an iteration within time step
!                            3  BACK solution to begining of time step

!      Outputs:
!         urate(nneq,nn)    Rate vectors:
!                            1  Velocity at t_n+1
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'ddata.h'
      include  'tdata.h'

      integer       :: n, nneq,isw
      real (kind=8) :: du(*),urate(nneq,*)

      save

!     Backward Euler: Initialize at start of step
      if(isw.eq.1) then

        do n = 1,nneq
          urate(n,nrt-1) = urate(n,1)
          urate(n,nrt  ) = urate(n,2)
          urate(n,1:2  ) = 0.0d0
        end do ! n

!     Backward Euler: Updates in iterations
      elseif(isw.eq.2) then

        do n = 1,nneq
          urate(n,1) = urate(n,1) + c1*du(n)
          urate(n,2) = 0.0d0
        end do ! n

!     Backward Euler: Back up to start of step
      elseif(isw.eq.3) then

        do n = 1,nneq
          urate(n,1) = urate(n,nrt-1)
          urate(n,2) = urate(n,nrt  )
        end do ! n

      endif

      end subroutine dyna04
