        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MASSPL__genmod
          INTERFACE 
            SUBROUTINE MASSPL(D,XL,NDM,NDF,NST,P,S)
              INTEGER(KIND=4) :: NST
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: XL(NDM,*)
              REAL(KIND=8) :: P(NDF,*)
              REAL(KIND=8) :: S(NST,NST)
            END SUBROUTINE MASSPL
          END INTERFACE 
        END MODULE MASSPL__genmod
