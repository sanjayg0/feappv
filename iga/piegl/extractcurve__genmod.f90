        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:06 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE EXTRACTCURVE__genmod
          INTERFACE 
            SUBROUTINE EXTRACTCURVE(N,P,U,NB,CE)
              INTEGER(KIND=4) :: P
              INTEGER(KIND=4) :: N
              REAL(KIND=8) :: U(0:*)
              INTEGER(KIND=4) :: NB
              REAL(KIND=8) :: CE(0:P,0:P,*)
            END SUBROUTINE EXTRACTCURVE
          END INTERFACE 
        END MODULE EXTRACTCURVE__genmod
