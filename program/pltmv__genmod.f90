        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:13 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PLTMV__genmod
          INTERFACE 
            SUBROUTINE PLTMV(PL,IPL,U,NPLTS,SNSAVE)
              INTEGER(KIND=4) :: NPLTS
              REAL(KIND=8) :: PL(NPLTS)
              INTEGER(KIND=4) :: IPL(2,NPLTS)
              REAL(KIND=8) :: U(*)
              REAL(KIND=8) :: SNSAVE
            END SUBROUTINE PLTMV
          END INTERFACE 
        END MODULE PLTMV__genmod
