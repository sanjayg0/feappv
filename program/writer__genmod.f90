        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:41 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE WRITER__genmod
          INTERFACE 
            SUBROUTINE WRITER(CTC,B,NNEQ)
              INTEGER(KIND=4) :: NNEQ
              CHARACTER(*) :: CTC
              REAL(KIND=8) :: B(NNEQ)
            END SUBROUTINE WRITER
          END INTERFACE 
        END MODULE WRITER__genmod
