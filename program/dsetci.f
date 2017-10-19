!$Id:$
      subroutine dsetci()

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2017: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Set integration constants for a dynamic analysis

!      Inputs:
!         none

!      Outputs:
!         gtan(3) - Integration parameters for tangent
!         c1      - Integration parameters for updates
!         c2      - Integration parameters for updates
!         c3      - Integration parameters for updates
!         c4      - Integration parameters for updates
!         c5      - Integration parameters for updates
!         cc1     - Integration parameters for updates
!         cc2     - Integration parameters for updates
!         cc3     - Integration parameters for updates
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'ddata.h'
      include  'gltran.h'
      include  'tdata.h'
      include  'tdatb.h'

      save

!     Static Algorithm

      if(noi.eq.0) then

        cc1 = 1.d0
        cc2 = 1.d0
        cc3 = 1.d0

!       Set update parameters for element

        gtan(1) = 1.d0
        gtan(2) = 0.d0
        gtan(3) = 0.d0

!     GNpj: or Newmark-Beta parameters

      elseif(noi.eq.1) then

        if(theta(2).eq.0.0d0) then

!         Set update parameters for dependent variable

          c1  = theta(1)*dt
          cc1 = c1
          cc2 = c1
          if(c1.gt.0.0d0) then
            cc3 = 1.d0/c1
          else
            cc3 = 0.d0
          endif

!         Set update parameters for element

          gtan(1) = c1
          gtan(2) = 1.d0
          gtan(3) = 1.d0

        else

!         Set update parameters for dependent variable

          c1  = 0.5d0*theta(2)*dt*dt
          cc1 = c1
          cc2 = c1
          if(c1.gt.0.0d0) then
            cc3 = 1.d0/c1
          else
            cc3 = 0.d0
          endif

!         Set update parameters for element

          gtan(1) = c1
          gtan(2) = theta(1)*dt
          gtan(3) = 1.d0

        endif

!     SSpj Algorithm

      elseif(noi.eq.2) then

        if(theta(2).eq.0.0d0) then

!         Set update parameters for dependent variable

          cc1 = dt
          cc2 = dt*theta(1)
          if(cc1.gt.0.0d0) then
            cc3 = 1.d0/cc1
          else
            cc3 = 0.d0
          endif

!         Set update parameters for element

          gtan(1) = dt*theta(1)
          gtan(2) = 1.d0
          gtan(3) = 1.d0

        else

!         Set update parameters for dependent variable

          c1  = 0.5d0*dt*dt
          cc1 = c1
          cc2 = c1*theta(2)
          if(cc1.gt.0.0d0) then
            cc3 = 1.d0/cc1
          else
            cc3 = 0.d0
          endif

!         Set update parameters for element

          gtan(1) = c1*theta(2)
          gtan(2) = dt*theta(1)
          gtan(3) = 1.d0

        endif

      elseif(noi.eq.-1) then

        call usetci(dt,theta,gtan,cc1,cc2,cc3)

      endif

      end
