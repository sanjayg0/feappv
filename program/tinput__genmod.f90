        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:38 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE TINPUT__genmod
          INTERFACE 
            FUNCTION TINPUT(TX,MT,D,NN)
              CHARACTER(LEN=15) :: TX(*)
              INTEGER(KIND=4) :: MT
              REAL(KIND=8) :: D(*)
              INTEGER(KIND=4) :: NN
              LOGICAL(KIND=4) :: TINPUT
            END FUNCTION TINPUT
          END INTERFACE 
        END MODULE TINPUT__genmod
