        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:32 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SETMAC__genmod
          INTERFACE 
            SUBROUTINE SETMAC(YYY,WD,NWD,LL,JCT,LCT,LZZ)
              INTEGER(KIND=4) :: NWD
              CHARACTER(LEN=80) :: YYY
              CHARACTER(LEN=4) :: WD(NWD)
              INTEGER(KIND=4) :: LL
              INTEGER(KIND=4) :: JCT(*)
              CHARACTER(LEN=15) :: LCT(*)
              CHARACTER(LEN=80) :: LZZ(*)
            END SUBROUTINE SETMAC
          END INTERFACE 
        END MODULE SETMAC__genmod
