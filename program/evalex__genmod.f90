        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:46 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE EVALEX__genmod
          INTERFACE 
            SUBROUTINE EVALEX(XS,V,VAL,NS,ERROR)
              CHARACTER(*) :: XS
              REAL(KIND=8) :: V(*)
              REAL(KIND=8) :: VAL
              INTEGER(KIND=4) :: NS
              LOGICAL(KIND=4) :: ERROR
            END SUBROUTINE EVALEX
          END INTERFACE 
        END MODULE EVALEX__genmod
