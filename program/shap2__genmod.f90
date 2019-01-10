        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:33 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SHAP2__genmod
          INTERFACE 
            SUBROUTINE SHAP2(S,T,SHP,IX,NEL)
              INTEGER(KIND=4) :: NEL
              REAL(KIND=8) :: S
              REAL(KIND=8) :: T
              REAL(KIND=8) :: SHP(3,NEL)
              INTEGER(KIND=4) :: IX(NEL)
            END SUBROUTINE SHAP2
          END INTERFACE 
        END MODULE SHAP2__genmod
