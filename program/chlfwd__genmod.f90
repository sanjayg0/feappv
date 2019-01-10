        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:37 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CHLFWD__genmod
          INTERFACE 
            SUBROUTINE CHLFWD(U,G,S,NN)
              INTEGER(KIND=4) :: NN
              REAL(KIND=8) :: U(*)
              REAL(KIND=8) :: G(*)
              REAL(KIND=8) :: S(NN,NN)
            END SUBROUTINE CHLFWD
          END INTERFACE 
        END MODULE CHLFWD__genmod
