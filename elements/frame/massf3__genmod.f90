        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:02 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MASSF3__genmod
          INTERFACE 
            SUBROUTINE MASSF3(S,R,CFAC,D,LE,NST,NDM,NDF)
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NST
              REAL(KIND=8) :: S(NST,NST)
              REAL(KIND=8) :: R(NDF,*)
              REAL(KIND=8) :: CFAC
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: LE
              INTEGER(KIND=4) :: NDM
            END SUBROUTINE MASSF3
          END INTERFACE 
        END MODULE MASSF3__genmod
