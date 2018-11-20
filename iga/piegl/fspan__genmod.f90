        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:12 2018
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
