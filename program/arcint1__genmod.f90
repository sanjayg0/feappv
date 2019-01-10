        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:34 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ARCINT1__genmod
          INTERFACE 
            SUBROUTINE ARCINT1(NR,XS,SIDE,IS,NS,NDM,SHP,X,RS)
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NR
              REAL(KIND=8) :: XS(3,*)
              INTEGER(KIND=4) :: SIDE
              INTEGER(KIND=4) :: IS(*)
              INTEGER(KIND=4) :: NS
              REAL(KIND=8) :: SHP(*)
              REAL(KIND=8) :: X(NDM,*)
              REAL(KIND=8) :: RS(3,*)
            END SUBROUTINE ARCINT1
          END INTERFACE 
        END MODULE ARCINT1__genmod
