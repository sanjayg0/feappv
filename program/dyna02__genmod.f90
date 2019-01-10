        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:44 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE DYNA02__genmod
          INTERFACE 
            SUBROUTINE DYNA02(DU,URATE,NNEQ,ISW)
              INTEGER(KIND=4) :: NNEQ
              REAL(KIND=8) :: DU(*)
              REAL(KIND=8) :: URATE(NNEQ,*)
              INTEGER(KIND=4) :: ISW
            END SUBROUTINE DYNA02
          END INTERFACE 
        END MODULE DYNA02__genmod
