        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:16 2018
        MODULE PGENURB__genmod
          INTERFACE 
            SUBROUTINE PGENURB(NDM,XDM,X,NURB,CARG,PRT,PRTH,ERR,PRTZ,   &
     &NWTFL)
              INTEGER(KIND=4) :: XDM
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: X(XDM,*)
              REAL(KIND=8) :: NURB(*)
              CHARACTER(*) :: CARG
              LOGICAL(KIND=4) :: PRT
              LOGICAL(KIND=4) :: PRTH
              LOGICAL(KIND=4) :: ERR
              LOGICAL(KIND=4) :: PRTZ
              LOGICAL(KIND=4) :: NWTFL
            END SUBROUTINE PGENURB
          END INTERFACE 
        END MODULE PGENURB__genmod
