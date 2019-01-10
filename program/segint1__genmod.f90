        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:31 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SEGINT1__genmod
          INTERFACE 
            SUBROUTINE SEGINT1(XS,SIDE,IS,NS,NDM,SHP,X)
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: XS(3,*)
              INTEGER(KIND=4) :: SIDE
              INTEGER(KIND=4) :: IS(*)
              INTEGER(KIND=4) :: NS
              REAL(KIND=8) :: SHP(*)
              REAL(KIND=8) :: X(NDM,*)
            END SUBROUTINE SEGINT1
          END INTERFACE 
        END MODULE SEGINT1__genmod
