!$Id:$
      subroutine pelnum(tx,iel,errck)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2024: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!     Modification log                                Date (dd/mm/year)
!       Original version                                    01/11/2006
!       1. Add St.Venant torsion                            19/04/2013
!       2. Add Robin (-15) & Winkler (-16) support surfaces 16/05/2017
!          Move coupled to -26
!       3. Add Fbar constraint element                      22/11/2017
!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Get material set numbers for FEAP elements

!              Current FEAP Element Types
!                 Name     |     iel
!              ------------+-------------
!               Solid      |      -1
!               Truss      |      -2
!               Frame      |      -3
!               Plate      |      -4
!               Shell      |      -5
!               Membrane   |      -6
!               Gap        |      -7
!               Thermal    |      -8
!               Convection |      -9
!               Point      |     -10
!               Pressure   |     -11
!               Torsion    |     -12
!               Acoustic   |     -13
!               Lysmerabc  |     -14
!               Null       |     -15
!               Robin      |     -16
!               Winkler    |     -17
!               Fbar       |     -18
!               Ebar       |     -19
!               Interface  |     -20
!               Fluid      |     -21
!               Stream     |     -22
!               Coupled:   |
!                  THMEch  !     -26

!      Inputs:
!         tx(2)  - Name of element type requested

!      Outputs:
!         iel    - Element type for request
!         errck  - Flag, true if request found
!-----[--.----+----.----+----.-----------------------------------------]
      implicit   none

      include   'iofile.h'
      include   'setups.h'

      character (len=15) :: tx(2)

      logical       :: pcomp, errck
      integer       :: iel

      save

      errck = .false.

!     Check based on coordinate dimension

      if    (pcomp(tx(1),'soli',4)) then
        iel = -1
      elseif(pcomp(tx(1),'trus',4)) then
        iel = -2
      elseif(pcomp(tx(1),'fram',4)) then
        iel = -3
      elseif(pcomp(tx(1),'plat',4)) then
        iel = -4
      elseif(pcomp(tx(1),'shel',4)) then
        iel = -5
      elseif(pcomp(tx(1),'memb',4)) then
        iel = -6
      elseif(pcomp(tx(1),'gap',3)) then
        iel = -7
      elseif(pcomp(tx(1),'ther',4)) then
        iel = -8
      elseif(pcomp(tx(1),'conv',4)) then
        iel = -9
      elseif(pcomp(tx(1),'poin',4)) then
        iel = -10
      elseif(pcomp(tx(1),'pres',4)) then
        iel = -11
      elseif(pcomp(tx(1),'tors',4)) then
        iel = -12
      elseif(pcomp(tx(1),'acou',4)) then
        iel = -13
      elseif(pcomp(tx(1),'labc',4)) then
        iel = -14
      elseif(pcomp(tx(1),'null',4)) then
        iel = -15
      elseif(pcomp(tx(1),'robi',4)) then
        iel = -16
      elseif(pcomp(tx(1),'wink',4)) then
        iel = -17
      elseif(pcomp(tx(1),'fbar',4)) then
        iel = -18
      elseif(pcomp(tx(1),'ebar',4)) then
        iel = -19
      elseif(pcomp(tx(1),'inte',4)) then
        iel = -20
      elseif(pcomp(tx(1),'flui',4)) then
        iel = -21
      elseif(pcomp(tx(1),'strm',4)) then
        iel = -22
      elseif(pcomp(tx(1),'coup',4)) then
        if(pcomp(tx(2),'thme',4)) then
          iel = -26
        else
          if(rank.eq.0) then
            write(*,*) ' Unknown coupled material type:',tx(2)
          endif
          write(iow,*) ' Unknown coupled material type:',tx(2)
          call plstop(.true.)
        endif
      else
        errck = .true.
      endif

      end subroutine pelnum
