        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:00 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE BEAM2D__genmod
          INTERFACE 
            SUBROUTINE BEAM2D(S,EA,EI,LE,CS,SN,NST,NDF)
              INTEGER(KIND=4) :: NST
              REAL(KIND=8) :: S(NST,NST)
              REAL(KIND=8) :: EA
              REAL(KIND=8) :: EI
              REAL(KIND=8) :: LE
              REAL(KIND=8) :: CS
              REAL(KIND=8) :: SN
              INTEGER(KIND=4) :: NDF
            END SUBROUTINE BEAM2D
          END INTERFACE 
        END MODULE BEAM2D__genmod
