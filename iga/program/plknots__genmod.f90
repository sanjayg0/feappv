        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:14 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PLKNOTS__genmod
          INTERFACE 
            SUBROUTINE PLKNOTS(LKDIM,LKNOTS,II,NURNP,NDM)
              INTEGER(KIND=4) :: NURNP
              INTEGER(KIND=4) :: II
              INTEGER(KIND=4) :: LKDIM(*)
              REAL(KIND=8) :: LKNOTS(II,NURNP)
              INTEGER(KIND=4) :: NDM
            END SUBROUTINE PLKNOTS
          END INTERFACE 
        END MODULE PLKNOTS__genmod
