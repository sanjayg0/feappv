        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:33 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SHAPEF__genmod
          INTERFACE 
            SUBROUTINE SHAPEF(S,T,XL,SHP,XSJ,NDM,FLG)
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: S
              REAL(KIND=8) :: T
              REAL(KIND=8) :: XL(NDM,4)
              REAL(KIND=8) :: SHP(3,4)
              REAL(KIND=8) :: XSJ
              LOGICAL(KIND=4) :: FLG
            END SUBROUTINE SHAPEF
          END INTERFACE 
        END MODULE SHAPEF__genmod
