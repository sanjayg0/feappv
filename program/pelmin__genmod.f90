        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:04 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PELMIN__genmod
          INTERFACE 
            SUBROUTINE PELMIN(TX,IDL,IX,NEN1,NMAT,NNTY,NORD,PRT,PRTH,   &
     &ERROR)
              INTEGER(KIND=4) :: NEN1
              CHARACTER(LEN=15) :: TX
              INTEGER(KIND=4) :: IDL(*)
              INTEGER(KIND=4) :: IX(NEN1,*)
              INTEGER(KIND=4) :: NMAT
              INTEGER(KIND=4) :: NNTY
              INTEGER(KIND=4) :: NORD
              LOGICAL(KIND=4) :: PRT
              LOGICAL(KIND=4) :: PRTH
              LOGICAL(KIND=4) :: ERROR
            END SUBROUTINE PELMIN
          END INTERFACE 
        END MODULE PELMIN__genmod
