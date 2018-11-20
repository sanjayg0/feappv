        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:25 2018
        MODULE PSETPW__genmod
          INTERFACE 
            SUBROUTINE PSETPW(LES,NDM,CSIDES,X,W,PW)
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: LES
              INTEGER(KIND=4) :: CSIDES(*)
              REAL(KIND=8) :: X(NDM,*)
              REAL(KIND=8) :: W(*)
              REAL(KIND=8) :: PW(NDM+1,*)
            END SUBROUTINE PSETPW
          END INTERFACE 
        END MODULE PSETPW__genmod
