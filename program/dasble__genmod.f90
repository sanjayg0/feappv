        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:41 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE DASBLE__genmod
          INTERFACE 
            SUBROUTINE DASBLE(S,P,LD,JP,NS,NEQS,AFL,BFL,B,AL,AU,AD)
              INTEGER(KIND=4) :: NS
              REAL(KIND=8) :: S(NS,NS)
              REAL(KIND=8) :: P(NS)
              INTEGER(KIND=4) :: LD(NS)
              INTEGER(KIND=4) :: JP(*)
              INTEGER(KIND=4) :: NEQS
              LOGICAL(KIND=4) :: AFL
              LOGICAL(KIND=4) :: BFL
              REAL(KIND=8) :: B(*)
              REAL(KIND=8) :: AL(*)
              REAL(KIND=8) :: AU(*)
              REAL(KIND=8) :: AD(*)
            END SUBROUTINE DASBLE
          END INTERFACE 
        END MODULE DASBLE__genmod
