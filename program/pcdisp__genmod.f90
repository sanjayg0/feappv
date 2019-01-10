        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:00 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PCDISP__genmod
          INTERFACE 
            SUBROUTINE PCDISP(TD,X,F,NTYP,NDM,NDF,NUMNP,NUMPRT,GAP0,PRT,&
     &PRTH)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: TD(*)
              REAL(KIND=8) :: X(NDM,NUMNP)
              REAL(KIND=8) :: F(NDF,NUMNP)
              INTEGER(KIND=4) :: NTYP(*)
              INTEGER(KIND=4) :: NUMPRT
              REAL(KIND=8) :: GAP0
              LOGICAL(KIND=4) :: PRT
              LOGICAL(KIND=4) :: PRTH
            END SUBROUTINE PCDISP
          END INTERFACE 
        END MODULE PCDISP__genmod
