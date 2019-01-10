        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:31 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CONVEC2D__genmod
          INTERFACE 
            SUBROUTINE CONVEC2D(D,UL,XL,IX,S,R,NDF,NDM,NST,ISW)
              INTEGER(KIND=4) :: NST
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NDF
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: UL(NDF,*)
              REAL(KIND=8) :: XL(NDM,*)
              INTEGER(KIND=4) :: IX(*)
              REAL(KIND=8) :: S(NST,*)
              REAL(KIND=8) :: R(NDF,*)
              INTEGER(KIND=4) :: ISW
            END SUBROUTINE CONVEC2D
          END INTERFACE 
        END MODULE CONVEC2D__genmod
