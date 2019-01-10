        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:33 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SHAP1D__genmod
          INTERFACE 
            SUBROUTINE SHAP1D(XI,NEL,SHP)
              INTEGER(KIND=4) :: NEL
              REAL(KIND=8) :: XI
              REAL(KIND=8) :: SHP(2,NEL)
            END SUBROUTINE SHAP1D
          END INTERFACE 
        END MODULE SHAP1D__genmod
