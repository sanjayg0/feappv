        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:53 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MSHCKSN__genmod
          INTERFACE 
            SUBROUTINE MSHCKSN(IS,IBLEND,NUMSD,NUMSN,NUMBD,ERRS)
              INTEGER(KIND=4) :: NUMBD
              INTEGER(KIND=4) :: NUMSD
              INTEGER(KIND=4) :: IS(16,NUMSD)
              INTEGER(KIND=4) :: IBLEND(21,NUMBD)
              INTEGER(KIND=4) :: NUMSN
              LOGICAL(KIND=4) :: ERRS
            END SUBROUTINE MSHCKSN
          END INTERFACE 
        END MODULE MSHCKSN__genmod
