        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:56 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PABOUN__genmod
          INTERFACE 
            SUBROUTINE PABOUN(TD,X,ANG,NTYP,NDM,NUMNP,NUMPRT,PRT,PRTH)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: TD(*)
              REAL(KIND=8) :: X(NDM,NUMNP)
              REAL(KIND=8) :: ANG(*)
              INTEGER(KIND=4) :: NTYP(*)
              INTEGER(KIND=4) :: NUMPRT
              LOGICAL(KIND=4) :: PRT
              LOGICAL(KIND=4) :: PRTH
            END SUBROUTINE PABOUN
          END INTERFACE 
        END MODULE PABOUN__genmod
