        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:57 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PASSBLE__genmod
          INTERFACE 
            SUBROUTINE PASSBLE(S,P,LD,IX,JP,A,AL,B,AFL,BFL,NSP,NOV,JSW)
              INTEGER(KIND=4) :: NSP
              REAL(KIND=8) :: S(NSP,*)
              REAL(KIND=8) :: P(*)
              INTEGER(KIND=4) :: LD(*)
              INTEGER(KIND=4) :: IX(*)
              INTEGER(KIND=4) :: JP(*)
              REAL(KIND=8) :: A(*)
              REAL(KIND=8) :: AL(*)
              REAL(KIND=8) :: B(*)
              LOGICAL(KIND=4) :: AFL
              LOGICAL(KIND=4) :: BFL
              INTEGER(KIND=4) :: NOV
              INTEGER(KIND=4) :: JSW
            END SUBROUTINE PASSBLE
          END INTERFACE 
        END MODULE PASSBLE__genmod
