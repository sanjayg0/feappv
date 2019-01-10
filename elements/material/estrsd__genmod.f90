        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:06 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ESTRSD__genmod
          INTERFACE 
            SUBROUTINE ESTRSD(D,TA,EPS,SIG,DD,DR)
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: TA
              REAL(KIND=8) :: EPS(6)
              REAL(KIND=8) :: SIG(6)
              REAL(KIND=8) :: DD(6,6)
              REAL(KIND=8) :: DR(6,6)
            END SUBROUTINE ESTRSD
          END INTERFACE 
        END MODULE ESTRSD__genmod
