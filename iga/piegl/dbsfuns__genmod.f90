        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:07 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE DBSFUNS__genmod
          INTERFACE 
            SUBROUTINE DBSFUNS(I,P,NCP,U,U_KNOT,N,DERS)
              INTEGER(KIND=4) :: N
              INTEGER(KIND=4) :: NCP
              INTEGER(KIND=4) :: P
              INTEGER(KIND=4) :: I
              REAL(KIND=8) :: U
              REAL(KIND=8) :: U_KNOT(P+NCP+1)
              REAL(KIND=8) :: DERS(N+1,P+1)
            END SUBROUTINE DBSFUNS
          END INTERFACE 
        END MODULE DBSFUNS__genmod
