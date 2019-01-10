        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:22 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PROCED__genmod
          INTERFACE 
            SUBROUTINE PROCED(PNAME,VV,WD,NWD,LL,JCT,LCT,CT,LZC,FLG,IOPL&
     &)
              INTEGER(KIND=4) :: NWD
              CHARACTER(LEN=12) :: PNAME
              CHARACTER(LEN=15) :: VV(3)
              CHARACTER(LEN=4) :: WD(NWD)
              INTEGER(KIND=4) :: LL
              INTEGER(KIND=4) :: JCT(*)
              CHARACTER(LEN=15) :: LCT(*)
              REAL(KIND=8) :: CT(3,*)
              CHARACTER(LEN=80) :: LZC(*)
              LOGICAL(KIND=4) :: FLG
              INTEGER(KIND=4) :: IOPL
            END SUBROUTINE PROCED
          END INTERFACE 
        END MODULE PROCED__genmod
