        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:09 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PHIST__genmod
          INTERFACE 
            SUBROUTINE PHIST(WD,CLAB2,JCT,LCT,CT,LL,IS)
              CHARACTER(LEN=4) :: WD(*)
              CHARACTER(LEN=4) :: CLAB2
              INTEGER(KIND=4) :: JCT(*)
              CHARACTER(LEN=15) :: LCT(*)
              REAL(KIND=8) :: CT(3,*)
              INTEGER(KIND=4) :: LL
              INTEGER(KIND=4) :: IS
            END SUBROUTINE PHIST
          END INTERFACE 
        END MODULE PHIST__genmod
