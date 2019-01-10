        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:23:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE UDYNAM__genmod
          INTERFACE 
            SUBROUTINE UDYNAM(DU,U,UD,NNEQ,ISW)
              INTEGER(KIND=4) :: NNEQ
              REAL(KIND=8) :: DU(*)
              REAL(KIND=8) :: U(NNEQ,2)
              REAL(KIND=8) :: UD(NNEQ,*)
              INTEGER(KIND=4) :: ISW
            END SUBROUTINE UDYNAM
          END INTERFACE 
        END MODULE UDYNAM__genmod
