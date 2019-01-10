        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:00 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MASSF2__genmod
          INTERFACE 
            SUBROUTINE MASSF2(S,P,CFAC,RA,LE,CS,SN,NST,NDF)
              INTEGER(KIND=4) :: NST
              REAL(KIND=8) :: S(NST,NST)
              REAL(KIND=8) :: P(NST)
              REAL(KIND=8) :: CFAC
              REAL(KIND=8) :: RA
              REAL(KIND=8) :: LE
              REAL(KIND=8) :: CS
              REAL(KIND=8) :: SN
              INTEGER(KIND=4) :: NDF
            END SUBROUTINE MASSF2
          END INTERFACE 
        END MODULE MASSF2__genmod
