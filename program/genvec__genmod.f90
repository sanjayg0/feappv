        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:48 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GENVEC__genmod
          INTERFACE 
            SUBROUTINE GENVEC(NDM,XDM,X,CARG,PRT,PRTH,ERR,PRTZ)
              INTEGER(KIND=4) :: XDM
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: X(XDM,*)
              CHARACTER(*) :: CARG
              LOGICAL(KIND=4) :: PRT
              LOGICAL(KIND=4) :: PRTH
              LOGICAL(KIND=4) :: ERR
              LOGICAL(KIND=4) :: PRTZ
            END SUBROUTINE GENVEC
          END INTERFACE 
        END MODULE GENVEC__genmod
