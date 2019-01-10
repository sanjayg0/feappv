        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:21 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SOLID1D__genmod
          INTERFACE 
            SUBROUTINE SOLID1D(D,UL,XL,IX,TL,S,P,NDF,NDM,NST,ISW)
              INTEGER(KIND=4) :: NST
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NDF
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: UL(NDF,4)
              REAL(KIND=8) :: XL(NDM,*)
              INTEGER(KIND=4) :: IX(*)
              REAL(KIND=8) :: TL(*)
              REAL(KIND=8) :: S(NST,NST)
              REAL(KIND=8) :: P(NST)
              INTEGER(KIND=4) :: ISW
            END SUBROUTINE SOLID1D
          END INTERFACE 
        END MODULE SOLID1D__genmod
