        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:12 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SPARSE_WB__genmod
          INTERFACE 
            SUBROUTINE SPARSE_WB(IS,IB,JS,JB,CS,CB,NUNI,NBIV,LB,WL,WB)
              INTEGER(KIND=4) :: IS(*)
              INTEGER(KIND=4) :: IB(*)
              INTEGER(KIND=4) :: JS(*)
              INTEGER(KIND=4) :: JB(*)
              REAL(KIND=8) :: CS(*)
              REAL(KIND=8) :: CB(*)
              INTEGER(KIND=4) :: NUNI
              INTEGER(KIND=4) :: NBIV
              INTEGER(KIND=4) :: LB
              REAL(KIND=8) :: WL(*)
              REAL(KIND=8) :: WB(*)
            END SUBROUTINE SPARSE_WB
          END INTERFACE 
        END MODULE SPARSE_WB__genmod
