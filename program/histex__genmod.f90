        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:49 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE HISTEX__genmod
          INTERFACE 
            SUBROUTINE HISTEX(WD,CLAB1,JCT,LCT,CT,NWD,NLP,NNX,LL,IS)
              INTEGER(KIND=4) :: NWD
              CHARACTER(LEN=4) :: WD(NWD)
              CHARACTER(LEN=4) :: CLAB1
              INTEGER(KIND=4) :: JCT(*)
              CHARACTER(LEN=15) :: LCT(*)
              REAL(KIND=8) :: CT(3,*)
              INTEGER(KIND=4) :: NLP
              INTEGER(KIND=4) :: NNX
              INTEGER(KIND=4) :: LL
              INTEGER(KIND=4) :: IS
            END SUBROUTINE HISTEX
          END INTERFACE 
        END MODULE HISTEX__genmod
