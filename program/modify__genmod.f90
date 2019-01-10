        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:53 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MODIFY__genmod
          INTERFACE 
            SUBROUTINE MODIFY(P,S,DUL,NSIZ,NST)
              INTEGER(KIND=4) :: NST
              REAL(KIND=8) :: P(NST)
              REAL(KIND=8) :: S(NST,NST)
              REAL(KIND=8) :: DUL(NST)
              INTEGER(KIND=4) :: NSIZ
            END SUBROUTINE MODIFY
          END INTERFACE 
        END MODULE MODIFY__genmod
