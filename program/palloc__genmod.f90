        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:57 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PALLOC__genmod
          INTERFACE 
            FUNCTION PALLOC(NUM,NAME,LENGTH,PRECIS)
              INTEGER(KIND=4) :: NUM
              CHARACTER(*) :: NAME
              INTEGER(KIND=4) :: LENGTH
              INTEGER(KIND=4) :: PRECIS
              LOGICAL(KIND=4) :: PALLOC
            END FUNCTION PALLOC
          END INTERFACE 
        END MODULE PALLOC__genmod
