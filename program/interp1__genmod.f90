        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:51 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE INTERP1__genmod
          INTERFACE 
            SUBROUTINE INTERP1(NR,XS,SIDE,IS,NS,NDM,SHP,X)
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NR
              REAL(KIND=8) :: XS(3,*)
              INTEGER(KIND=4) :: SIDE
              INTEGER(KIND=4) :: IS(*)
              INTEGER(KIND=4) :: NS
              REAL(KIND=8) :: SHP(*)
              REAL(KIND=8) :: X(NDM,*)
            END SUBROUTINE INTERP1
          END INTERFACE 
        END MODULE INTERP1__genmod
