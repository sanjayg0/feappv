        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:04 2018
        MODULE SOLID2D__genmod
          INTERFACE 
            SUBROUTINE SOLID2D(D,UL,XL,IX,TL,S,P,NDF,NDM,NST,ISW)
              INTEGER(KIND=4) :: NST
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NDF
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: UL(NDF,16)
              REAL(KIND=8) :: XL(NDM,*)
              INTEGER(KIND=4) :: IX(*)
              REAL(KIND=8) :: TL(*)
              REAL(KIND=8) :: S(NST,NST)
              REAL(KIND=8) :: P(NST)
              INTEGER(KIND=4) :: ISW
            END SUBROUTINE SOLID2D
          END INTERFACE 
        END MODULE SOLID2D__genmod
