        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:25 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PSETVOL__genmod
          INTERFACE 
            SUBROUTINE PSETVOL(X,NDM,NUMNP)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: X(NDM,NUMNP)
            END SUBROUTINE PSETVOL
          END INTERFACE 
        END MODULE PSETVOL__genmod
