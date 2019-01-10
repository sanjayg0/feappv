        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:06 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE EPPS2D__genmod
          INTERFACE 
            SUBROUTINE EPPS2D(D,EPS,EPSP,ALP,EPN,ISTRT,SIG,DD,DR)
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: EPS(*)
              REAL(KIND=8) :: EPSP(*)
              REAL(KIND=8) :: ALP(*)
              REAL(KIND=8) :: EPN(2)
              INTEGER(KIND=4) :: ISTRT
              REAL(KIND=8) :: SIG(*)
              REAL(KIND=8) :: DD(6,6)
              REAL(KIND=8) :: DR(6,6)
            END SUBROUTINE EPPS2D
          END INTERFACE 
        END MODULE EPPS2D__genmod
