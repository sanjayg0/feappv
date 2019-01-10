        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:24 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PRTREA__genmod
          INTERFACE 
            SUBROUTINE PRTREA(R,X,NDM,NDF,N1,N2,N3,PRTH)
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: R(NDF,*)
              REAL(KIND=8) :: X(NDM,*)
              INTEGER(KIND=4) :: N1
              INTEGER(KIND=4) :: N2
              INTEGER(KIND=4) :: N3
              LOGICAL(KIND=4) :: PRTH
            END SUBROUTINE PRTREA
          END INTERFACE 
        END MODULE PRTREA__genmod
