        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:21 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE STRN1M__genmod
          INTERFACE 
            SUBROUTINE STRN1M(SHP,XL,UL,THETA,IRAD,JRAD,NDM,NDF,NEL,NEN,&
     &EPS)
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: SHP(2,*)
              REAL(KIND=8) :: XL(NDM,NEN)
              REAL(KIND=8) :: UL(NDF,NEN)
              REAL(KIND=8) :: THETA
              REAL(KIND=8) :: IRAD
              REAL(KIND=8) :: JRAD
              INTEGER(KIND=4) :: NEL
              REAL(KIND=8) :: EPS(*)
            END SUBROUTINE STRN1M
          END INTERFACE 
        END MODULE STRN1M__genmod
