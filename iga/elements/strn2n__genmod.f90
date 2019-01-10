        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:01 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE STRN2N__genmod
          INTERFACE 
            SUBROUTINE STRN2N(SHP,XL,UL,THETA,IRAD,NDM,NDF,NEL,NEN,EPS)
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: SHP(3,*)
              REAL(KIND=8) :: XL(NDM,NEN)
              REAL(KIND=8) :: UL(NDF,NEN,*)
              REAL(KIND=8) :: THETA(2)
              REAL(KIND=8) :: IRAD
              INTEGER(KIND=4) :: NEL
              REAL(KIND=8) :: EPS(9,*)
            END SUBROUTINE STRN2N
          END INTERFACE 
        END MODULE STRN2N__genmod
