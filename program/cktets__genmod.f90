        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:39 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CKTETS__genmod
          INTERFACE 
            SUBROUTINE CKTETS(N,IX,XL,NDM,NEL,SHP)
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: N
              INTEGER(KIND=4) :: IX(*)
              REAL(KIND=8) :: XL(NDM,*)
              INTEGER(KIND=4) :: NEL
              REAL(KIND=8) :: SHP(*)
            END SUBROUTINE CKTETS
          END INTERFACE 
        END MODULE CKTETS__genmod
