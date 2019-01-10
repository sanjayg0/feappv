        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:14 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ROTS3D__genmod
          INTERFACE 
            SUBROUTINE ROTS3D(S,P,T,NST,NDF)
              INTEGER(KIND=4) :: NST
              REAL(KIND=8) :: S(NST,NST)
              REAL(KIND=8) :: P(NST)
              REAL(KIND=8) :: T(3,3)
              INTEGER(KIND=4) :: NDF
            END SUBROUTINE ROTS3D
          END INTERFACE 
        END MODULE ROTS3D__genmod
