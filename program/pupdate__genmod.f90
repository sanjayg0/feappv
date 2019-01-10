        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:40 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PUPDATE__genmod
          INTERFACE 
            SUBROUTINE PUPDATE(ID,F,U,URATE,DU,FDYN,ISW)
              COMMON/SDATA/ NDF,NDM,NEN1,NST,NNEQ
                INTEGER(KIND=4) :: NDF
                INTEGER(KIND=4) :: NDM
                INTEGER(KIND=4) :: NEN1
                INTEGER(KIND=4) :: NST
                INTEGER(KIND=4) :: NNEQ
              INTEGER(KIND=4) :: ID(*)
              REAL(KIND=8) :: F(NNEQ,*)
              REAL(KIND=8) :: U(*)
              REAL(KIND=8) :: URATE(NNEQ,*)
              REAL(KIND=8) :: DU(*)
              LOGICAL(KIND=4) :: FDYN
              INTEGER(KIND=4) :: ISW
            END SUBROUTINE PUPDATE
          END INTERFACE 
        END MODULE PUPDATE__genmod
