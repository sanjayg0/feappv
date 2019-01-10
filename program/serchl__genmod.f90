        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:31 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SERCHL__genmod
          INTERFACE 
            SUBROUTINE SERCHL(GTOL,ID,PRSD,PU,D,STOL,T,NEQ,STEP)
              REAL(KIND=8) :: GTOL
              INTEGER(KIND=4) :: ID(*)
              INTEGER(KIND=8) :: PRSD
              INTEGER(KIND=8) :: PU
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: STOL
              REAL(KIND=8) :: T(*)
              INTEGER(KIND=4) :: NEQ
              REAL(KIND=8) :: STEP
            END SUBROUTINE SERCHL
          END INTERFACE 
        END MODULE SERCHL__genmod
