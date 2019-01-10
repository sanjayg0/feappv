        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:18 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PMOVEC__genmod
          INTERFACE 
            SUBROUTINE PMOVEC(ID,A,B,NN)
              INTEGER(KIND=4) :: NN
              INTEGER(KIND=4) :: ID(*)
              REAL(KIND=8) :: A(NN)
              REAL(KIND=8) :: B(NN)
            END SUBROUTINE PMOVEC
          END INTERFACE 
        END MODULE PMOVEC__genmod
