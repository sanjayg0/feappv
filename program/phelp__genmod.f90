        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:08 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PHELP__genmod
          INTERFACE 
            SUBROUTINE PHELP(CC,WD,ED,NWD,WRD)
              INTEGER(KIND=4) :: NWD
              CHARACTER(LEN=4) :: CC
              CHARACTER(LEN=4) :: WD(NWD)
              INTEGER(KIND=4) :: ED(NWD)
              CHARACTER(*) :: WRD
            END SUBROUTINE PHELP
          END INTERFACE 
        END MODULE PHELP__genmod
