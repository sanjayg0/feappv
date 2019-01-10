        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:37 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE TETSHP__genmod
          INTERFACE 
            SUBROUTINE TETSHP(XI,XL,NDM,XSJ,SHP)
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: XI(4)
              REAL(KIND=8) :: XL(NDM,*)
              REAL(KIND=8) :: XSJ
              REAL(KIND=8) :: SHP(4,*)
            END SUBROUTINE TETSHP
          END INTERFACE 
        END MODULE TETSHP__genmod
