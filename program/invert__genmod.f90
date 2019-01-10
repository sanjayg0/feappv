        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:51 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE INVERT__genmod
          INTERFACE 
            SUBROUTINE INVERT(A,NMAX,NDM)
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: A(NDM,*)
              INTEGER(KIND=4) :: NMAX
            END SUBROUTINE INVERT
          END INTERFACE 
        END MODULE INVERT__genmod
