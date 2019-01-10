        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:20 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PCURVIN__genmod
          INTERFACE 
            SUBROUTINE PCURVIN(LES,ORD,LEK,UU,R,NS,UW,X,WT,LEQ,LEU)
              COMMON/SDATA/ NDF,NDM,NEN1,NST,NNEQ
                INTEGER(KIND=4) :: NDF
                INTEGER(KIND=4) :: NDM
                INTEGER(KIND=4) :: NEN1
                INTEGER(KIND=4) :: NST
                INTEGER(KIND=4) :: NNEQ
              INTEGER(KIND=4) :: LES
              INTEGER(KIND=4) :: ORD
              INTEGER(KIND=4) :: LEK
              REAL(KIND=8) :: UU
              INTEGER(KIND=4) :: R
              INTEGER(KIND=4) :: NS(*)
              REAL(KIND=8) :: UW(*)
              REAL(KIND=8) :: X(NDM,*)
              REAL(KIND=8) :: WT(*)
              INTEGER(KIND=4) :: LEQ
              INTEGER(KIND=4) :: LEU
            END SUBROUTINE PCURVIN
          END INTERFACE 
        END MODULE PCURVIN__genmod
