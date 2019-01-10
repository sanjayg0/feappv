        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:24 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PRTSTR__genmod
          INTERFACE 
            SUBROUTINE PRTSTR(X,DP,DS,NDM,NUMNP,N1,N2,N3,PRTH)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: X(NDM,*)
              REAL(KIND=8) :: DP(NUMNP,*)
              REAL(KIND=8) :: DS(NUMNP,*)
              INTEGER(KIND=4) :: N1
              INTEGER(KIND=4) :: N2
              INTEGER(KIND=4) :: N3
              LOGICAL(KIND=4) :: PRTH
            END SUBROUTINE PRTSTR
          END INTERFACE 
        END MODULE PRTSTR__genmod
