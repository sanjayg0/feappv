        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:23 2018
        MODULE PCURVEL__genmod
          INTERFACE 
            SUBROUTINE PCURVEL(LES,ORD,LEK,DEG,NS,UW,X,WT,LEQ,LEU)
              COMMON/SDATA/ NDF,NDM,NEN1,NST,NNEQ
                INTEGER(KIND=4) :: NDF
                INTEGER(KIND=4) :: NDM
                INTEGER(KIND=4) :: NEN1
                INTEGER(KIND=4) :: NST
                INTEGER(KIND=4) :: NNEQ
              INTEGER(KIND=4) :: LES
              INTEGER(KIND=4) :: ORD
              INTEGER(KIND=4) :: LEK
              INTEGER(KIND=4) :: DEG
              INTEGER(KIND=4) :: NS(*)
              REAL(KIND=8) :: UW(*)
              REAL(KIND=8) :: X(NDM,*)
              REAL(KIND=8) :: WT(*)
              INTEGER(KIND=4) :: LEQ
              INTEGER(KIND=4) :: LEU
            END SUBROUTINE PCURVEL
          END INTERFACE 
        END MODULE PCURVEL__genmod
