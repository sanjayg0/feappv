        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:06 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MISES__genmod
          INTERFACE 
            SUBROUTINE MISES(D,EPS,EPSP,EPP,ISTRT,SIG,DD,DR)
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: EPS(*)
              REAL(KIND=8) :: EPSP(*)
              REAL(KIND=8) :: EPP(*)
              INTEGER(KIND=4) :: ISTRT
              REAL(KIND=8) :: SIG(*)
              REAL(KIND=8) :: DD(6,6)
              REAL(KIND=8) :: DR(6,6)
            END SUBROUTINE MISES
          END INTERFACE 
        END MODULE MISES__genmod
