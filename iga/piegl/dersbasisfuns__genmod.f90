        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:11 2018
        MODULE DERSBASISFUNS__genmod
          INTERFACE 
            SUBROUTINE DERSBASISFUNS(I,UU,P,ND,U,DERS)
              INTEGER(KIND=4) :: ND
              INTEGER(KIND=4) :: P
              INTEGER(KIND=4) :: I
              REAL(KIND=8) :: UU
              REAL(KIND=8) :: U(0:*)
              REAL(KIND=8) :: DERS(0:ND,0:P)
            END SUBROUTINE DERSBASISFUNS
          END INTERFACE 
        END MODULE DERSBASISFUNS__genmod
