        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:24 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PRTDIS__genmod
          INTERFACE 
            SUBROUTINE PRTDIS(X,B,TTIM,PROP,NDM,NDF,N1,N2,N3,II,PRTH)
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: X(NDM,*)
              REAL(KIND=8) :: B(NDF,*)
              REAL(KIND=8) :: TTIM
              REAL(KIND=8) :: PROP
              INTEGER(KIND=4) :: N1
              INTEGER(KIND=4) :: N2
              INTEGER(KIND=4) :: N3
              INTEGER(KIND=4) :: II
              LOGICAL(KIND=4) :: PRTH
            END SUBROUTINE PRTDIS
          END INTERFACE 
        END MODULE PRTDIS__genmod
