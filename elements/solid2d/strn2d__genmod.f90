        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:27 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE STRN2D__genmod
          INTERFACE 
            SUBROUTINE STRN2D(D,XL,UL,TL,SHP,NDF,NDM,NEL,XX,YY,TA,EPS)
              COMMON/CDATA/ NUMNP,NUMEL,NUMMAT,NEN,NEQ,IPR,NETYP
                INTEGER(KIND=4) :: NUMNP
                INTEGER(KIND=4) :: NUMEL
                INTEGER(KIND=4) :: NUMMAT
                INTEGER(KIND=4) :: NEN
                INTEGER(KIND=4) :: NEQ
                INTEGER(KIND=4) :: IPR
                INTEGER(KIND=4) :: NETYP
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NDF
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: XL(NDM,*)
              REAL(KIND=8) :: UL(NDF,NEN,*)
              REAL(KIND=8) :: TL(*)
              REAL(KIND=8) :: SHP(3,*)
              INTEGER(KIND=4) :: NEL
              REAL(KIND=8) :: XX
              REAL(KIND=8) :: YY
              REAL(KIND=8) :: TA
              REAL(KIND=8) :: EPS(9,3)
            END SUBROUTINE STRN2D
          END INTERFACE 
        END MODULE STRN2D__genmod
