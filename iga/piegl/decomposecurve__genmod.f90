        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:06 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE DECOMPOSECURVE__genmod
          INTERFACE 
            SUBROUTINE DECOMPOSECURVE(N,P,U,PW,NB,QW,NDM)
              INTEGER(KIND=4) :: P
              INTEGER(KIND=4) :: N
              REAL(KIND=8) :: U(0:*)
              REAL(KIND=8) :: PW(4,0:*)
              INTEGER(KIND=4) :: NB
              REAL(KIND=8) :: QW(4,0:5,*)
              INTEGER(KIND=4) :: NDM
            END SUBROUTINE DECOMPOSECURVE
          END INTERFACE 
        END MODULE DECOMPOSECURVE__genmod
