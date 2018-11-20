        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:09 2018
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
