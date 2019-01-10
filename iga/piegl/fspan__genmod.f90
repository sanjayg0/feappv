        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:09 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FSPAN__genmod
          INTERFACE 
            FUNCTION FSPAN(N,U,P,U_KNOT)
              INTEGER(KIND=4) :: P
              INTEGER(KIND=4) :: N
              REAL(KIND=8) :: U
              REAL(KIND=8) :: U_KNOT(N+P+1)
              INTEGER(KIND=4) :: FSPAN
            END FUNCTION FSPAN
          END INTERFACE 
        END MODULE FSPAN__genmod
