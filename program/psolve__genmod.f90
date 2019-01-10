        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:26 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PSOLVE__genmod
          INTERFACE 
            SUBROUTINE PSOLVE(B,FP,FACTOR,SOLVE,CFR,PRNT)
              REAL(KIND=8) :: B(*)
              INTEGER(KIND=8) :: FP(10)
              LOGICAL(KIND=4) :: FACTOR
              LOGICAL(KIND=4) :: SOLVE
              LOGICAL(KIND=4) :: CFR
              LOGICAL(KIND=4) :: PRNT
            END SUBROUTINE PSOLVE
          END INTERFACE 
        END MODULE PSOLVE__genmod
