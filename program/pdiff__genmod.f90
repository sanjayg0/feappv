        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:03 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PDIFF__genmod
          INTERFACE 
            FUNCTION PDIFF(X,I,NDM,NUMNP)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: X(NDM,NUMNP)
              INTEGER(KIND=4) :: I
              REAL(KIND=8) :: PDIFF
            END FUNCTION PDIFF
          END INTERFACE 
        END MODULE PDIFF__genmod
