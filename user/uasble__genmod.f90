        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:23:09 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE UASBLE__genmod
          INTERFACE 
            SUBROUTINE UASBLE(S,P,LD,NS,AFL,BFL,B)
              INTEGER(KIND=4) :: NS
              REAL(KIND=8) :: S(NS,NS)
              REAL(KIND=8) :: P(NS)
              INTEGER(KIND=4) :: LD(NS)
              LOGICAL(KIND=4) :: AFL
              LOGICAL(KIND=4) :: BFL
              REAL(KIND=8) :: B(*)
            END SUBROUTINE UASBLE
          END INTERFACE 
        END MODULE UASBLE__genmod
