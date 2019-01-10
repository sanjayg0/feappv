        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:45 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE EISQL__genmod
          INTERFACE 
            SUBROUTINE EISQL(A,D,E,Z,N,IERR)
              INTEGER(KIND=4) :: N
              REAL(KIND=8) :: A(*)
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: E(*)
              REAL(KIND=8) :: Z(N,N)
              INTEGER(KIND=4) :: IERR
            END SUBROUTINE EISQL
          END INTERFACE 
        END MODULE EISQL__genmod
