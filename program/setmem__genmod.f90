        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:32 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SETMEM__genmod
          INTERFACE 
            FUNCTION SETMEM(LIST,MLIST,RLIST,NUM,MNAME,LENGTH,PRECIS)
              INTEGER(KIND=4) :: LIST
              INTEGER(KIND=4) :: MLIST(2,LIST)
              CHARACTER(LEN=5) :: RLIST(LIST)
              INTEGER(KIND=4) :: NUM
              CHARACTER(*) :: MNAME
              INTEGER(KIND=4) :: LENGTH
              INTEGER(KIND=4) :: PRECIS
              LOGICAL(KIND=4) :: SETMEM
            END FUNCTION SETMEM
          END INTERFACE 
        END MODULE SETMEM__genmod
