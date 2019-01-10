        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:37 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CHLBAC__genmod
          INTERFACE 
            SUBROUTINE CHLBAC(U,S,NN)
              INTEGER(KIND=4) :: NN
              REAL(KIND=8) :: U(*)
              REAL(KIND=8) :: S(NN,NN)
            END SUBROUTINE CHLBAC
          END INTERFACE 
        END MODULE CHLBAC__genmod
