        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:13 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PMACIO__genmod
          INTERFACE 
            SUBROUTINE PMACIO(JCT,LCT,CT,WD,ED,NWD,NLP,NIF,LL,PRTH)
              INTEGER(KIND=4) :: NWD
              INTEGER(KIND=4) :: JCT(*)
              CHARACTER(LEN=15) :: LCT(*)
              REAL(KIND=8) :: CT(3,*)
              CHARACTER(LEN=4) :: WD(NWD)
              INTEGER(KIND=4) :: ED(NWD)
              INTEGER(KIND=4) :: NLP
              INTEGER(KIND=4) :: NIF
              INTEGER(KIND=4) :: LL
              LOGICAL(KIND=4) :: PRTH
            END SUBROUTINE PMACIO
          END INTERFACE 
        END MODULE PMACIO__genmod
