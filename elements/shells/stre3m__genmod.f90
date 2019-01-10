        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:09 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE STRE3M__genmod
          INTERFACE 
            SUBROUTINE STRE3M(D,XL,VL,NDM,NEL,L,XX,YY,ZZ,EPS,NORM,DD)
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: XL(NDM,*)
              REAL(KIND=8) :: VL(6,*)
              INTEGER(KIND=4) :: NEL
              INTEGER(KIND=4) :: L
              REAL(KIND=8) :: XX
              REAL(KIND=8) :: YY
              REAL(KIND=8) :: ZZ
              REAL(KIND=8) :: EPS(6)
              REAL(KIND=8) :: NORM(6)
              REAL(KIND=8) :: DD(6,6)
            END SUBROUTINE STRE3M
          END INTERFACE 
        END MODULE STRE3M__genmod
