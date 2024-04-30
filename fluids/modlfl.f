!$Id:$
      subroutine modlfl(ii,d,ta,eps,veps,h1,h2,nh,istrt, dd,sig,
     &                  alam,ha,isw)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2024: Regents of the University of California
!                               All rights reserved
!-----[--.----+----.----+----.-----------------------------------------]
!     Modification log                                Date (dd/mm/year)
!       Original version                                    02/04/2018
!-----[--.----+----.----+----.-----------------------------------------]
!     Purpose: Fluid Constitutive Equation Driver

!     Input parameters
!          ii        -  Point being processed
!          d(*)      -  up to ndd-nud-1 material parameters
!          ta        -  Temperature change from stress free state
!          eps(9,3)  -  Current strain rates and fluxes at point
!          h(nh)     -  History terms at point
!          nh        -  Number of history terms
!          istrt     -  Start state: 0 = elastic; 1 = last solution
!          alam      -  Augmented multiplier
!          im        -  Material type
!     Ouput parameters
!          dd(6,6,5) -  Current material tangent moduli
!                       Coupled problems:    | dd_1   dd_2 |
!                                            | dd_3   dd_4 |
!                       Rayleigh damping: dd_5
!          sig(6)    -  Stresses at point.
!          ha        -  Augmented function (trace-eps)
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'cdat1.h'
      include  'eldata.h'

      include  'pointer.h'
      include  'comblk.h'

      integer       :: ii,nh,istrt,isw, umat,uprm, imat
      real (kind=8) :: alam, ha, ta, epsth, veps, elamd,eha
      real (kind=8) :: d(*),eps(9,*),dd(6,6,5),sig(*),theta(3)
      real (kind=8) :: h1(*),h2(*)

      save

!     Check for user model
      uprm  = ndd-nud
      umat  = int(d(uprm)) - 100

!     Zero stress and dd arrays
      sig(1:6)  = 0.0d0
      dd(:,:,:) = 0.0d0
      epsth     = 0.0d0 ! Thermal strain rate for augmenting

!     Set constant initial stresses
      if(nint(d(160)).eq.1) then
        sig(1:6) = d(161:166)
      end if

!     Program material models
      if(umat.lt.0) then

        imat = nint(d(20))

!       Newtonian fluid
        if(imat.eq.1) then

          call newtonian(d,eps,veps,  sig, dd(1,1,1))

        endif

!     U s e r    M o d e l    I n t e r f a c e
      else

!       Compute trace to pass to user module
        theta(1:3) = eps(1,1:3) + eps(2,1:3) + eps(3,1:3)
        elamd      = alam
        eha        = ha
        call umodel(umat,eps,theta,ta,d(1),d(uprm+1),h1(1),h2(1),nh,
     &              ii,istrt,sig,dd,isw)
        alam      = elamd
        ha        = eha

      end if

!     Compute augmented function (trace-epsilon = 0)

      ha       = veps- epsth
      sig(1:3) = sig(1:3)   + alam

      end subroutine modlfl
