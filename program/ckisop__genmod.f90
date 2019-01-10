        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:38 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CKISOP__genmod
          INTERFACE 
            SUBROUTINE CKISOP(IX,XL,SHP,NDM)
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: IX(*)
              REAL(KIND=8) :: XL(NDM,*)
              REAL(KIND=8) :: SHP(*)
            END SUBROUTINE CKISOP
          END INTERFACE 
        END MODULE CKISOP__genmod
