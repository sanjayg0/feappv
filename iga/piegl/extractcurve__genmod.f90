        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:09 2018
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
