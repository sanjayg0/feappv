        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:13 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE TRSH2D__genmod
          INTERFACE 
            SUBROUTINE TRSH2D(COSPHI,SINPHI,RR,SS,R,S,NDF,NST)
              INTEGER(KIND=4) :: NST
              INTEGER(KIND=4) :: NDF
              REAL(KIND=8) :: COSPHI
              REAL(KIND=8) :: SINPHI
              REAL(KIND=8) :: RR(3,*)
              REAL(KIND=8) :: SS(6,*)
              REAL(KIND=8) :: R(NDF,*)
              REAL(KIND=8) :: S(NST,*)
            END SUBROUTINE TRSH2D
          END INTERFACE 
        END MODULE TRSH2D__genmod
