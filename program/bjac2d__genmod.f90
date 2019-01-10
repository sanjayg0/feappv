        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:35 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE BJAC2D__genmod
          INTERFACE 
            SUBROUTINE BJAC2D(RST,XL,NDM,SHP,DETJ)
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: RST(2)
              REAL(KIND=8) :: XL(NDM,*)
              REAL(KIND=8) :: SHP(3,4)
              REAL(KIND=8) :: DETJ
            END SUBROUTINE BJAC2D
          END INTERFACE 
        END MODULE BJAC2D__genmod
