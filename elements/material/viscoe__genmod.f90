        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:06 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE VISCOE__genmod
          INTERFACE 
            SUBROUTINE VISCOE(D,EPS,EN,QI,NTM,SIG,DD,DR)
              INTEGER(KIND=4) :: NTM
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: EPS(*)
              REAL(KIND=8) :: EN(*)
              REAL(KIND=8) :: QI(NTM,*)
              REAL(KIND=8) :: SIG(*)
              REAL(KIND=8) :: DD(6,6)
              REAL(KIND=8) :: DR(6,6)
            END SUBROUTINE VISCOE
          END INTERFACE 
        END MODULE VISCOE__genmod
