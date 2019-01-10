        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:28 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE INER3D__genmod
          INTERFACE 
            SUBROUTINE INER3D(D,XL,VL,AL,S,R,NEL,NDF,NDM,NST)
              INTEGER(KIND=4) :: NST
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NEL
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: XL(NDM,NEL)
              REAL(KIND=8) :: VL(NDF,NEL)
              REAL(KIND=8) :: AL(NDF,NEL)
              REAL(KIND=8) :: S(NST,NST)
              REAL(KIND=8) :: R(NDF,NEL)
            END SUBROUTINE INER3D
          END INTERFACE 
        END MODULE INER3D__genmod
