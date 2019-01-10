        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:04 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PEIGE__genmod
          INTERFACE 
            SUBROUTINE PEIGE(S,NST,DR,VFLG)
              INTEGER(KIND=4) :: NST
              REAL(KIND=8) :: S(NST,NST)
              REAL(KIND=8) :: DR(*)
              LOGICAL(KIND=4) :: VFLG
            END SUBROUTINE PEIGE
          END INTERFACE 
        END MODULE PEIGE__genmod
