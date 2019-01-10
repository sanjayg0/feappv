        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:14 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE STR3DI__genmod
          INTERFACE 
            SUBROUTINE STR3DI(D,XL,VL,NDM,NEL,L,XX,YY,ZZ,HH,EPS,SIG,DD, &
     &NN,ISW)
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: XL(NDM,*)
              REAL(KIND=8) :: VL(6,*)
              INTEGER(KIND=4) :: NEL
              INTEGER(KIND=4) :: L
              REAL(KIND=8) :: XX
              REAL(KIND=8) :: YY
              REAL(KIND=8) :: ZZ
              REAL(KIND=8) :: HH
              REAL(KIND=8) :: EPS(6)
              REAL(KIND=8) :: SIG(6)
              REAL(KIND=8) :: DD(6,6,5)
              INTEGER(KIND=4) :: NN
              INTEGER(KIND=4) :: ISW
            END SUBROUTINE STR3DI
          END INTERFACE 
        END MODULE STR3DI__genmod
