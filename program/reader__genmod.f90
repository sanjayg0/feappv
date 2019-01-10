        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:28 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE READER__genmod
          INTERFACE 
            SUBROUTINE READER(CTC,B,NNEQ)
              INTEGER(KIND=4) :: NNEQ
              CHARACTER(*) :: CTC
              REAL(KIND=8) :: B(NNEQ)
            END SUBROUTINE READER
          END INTERFACE 
        END MODULE READER__genmod
