        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:35 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SHPTRI__genmod
          INTERFACE 
            SUBROUTINE SHPTRI(EL,XL,NDM,NEL,XSJ,SHP,FLG)
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: EL(4)
              REAL(KIND=8) :: XL(NDM,*)
              INTEGER(KIND=4) :: NEL
              REAL(KIND=8) :: XSJ
              REAL(KIND=8) :: SHP(3,*)
              LOGICAL(KIND=4) :: FLG
            END SUBROUTINE SHPTRI
          END INTERFACE 
        END MODULE SHPTRI__genmod
