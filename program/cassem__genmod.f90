        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:36 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CASSEM__genmod
          INTERFACE 
            SUBROUTINE CASSEM(AD,AU,AL,S,IR,JC,LD,NST,ALFL,BYCOL,DIAGIN,&
     &ALL)
              INTEGER(KIND=4) :: NST
              REAL(KIND=8) :: AD(*)
              REAL(KIND=8) :: AU(*)
              REAL(KIND=8) :: AL(*)
              REAL(KIND=8) :: S(NST,NST)
              INTEGER(KIND=4) :: IR(*)
              INTEGER(KIND=4) :: JC(*)
              INTEGER(KIND=4) :: LD(*)
              LOGICAL(KIND=4) :: ALFL
              LOGICAL(KIND=4) :: BYCOL
              LOGICAL(KIND=4) :: DIAGIN
              LOGICAL(KIND=4) :: ALL
            END SUBROUTINE CASSEM
          END INTERFACE 
        END MODULE CASSEM__genmod
