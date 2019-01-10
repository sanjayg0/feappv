        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:29 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MASS3D__genmod
          INTERFACE 
            SUBROUTINE MASS3D(D,XL,S,P,NDF,NDM,NST)
              INTEGER(KIND=4) :: NST
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: XL(NDM,*)
              REAL(KIND=8) :: S(NST,NST)
              REAL(KIND=8) :: P(NST)
              INTEGER(KIND=4) :: NDF
            END SUBROUTINE MASS3D
          END INTERFACE 
        END MODULE MASS3D__genmod
