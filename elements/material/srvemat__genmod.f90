        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:09 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SRVEMAT__genmod
          INTERFACE 
            SUBROUTINE SRVEMAT(D,EPS,TA,HN,HN1,NH,SIG,DD,ISW)
              INTEGER(KIND=4) :: NH
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: EPS(6)
              REAL(KIND=8) :: TA
              REAL(KIND=8) :: HN(NH)
              REAL(KIND=8) :: HN1(NH)
              REAL(KIND=8) :: SIG(*)
              REAL(KIND=8) :: DD(6,*)
              INTEGER(KIND=4) :: ISW
            END SUBROUTINE SRVEMAT
          END INTERFACE 
        END MODULE SRVEMAT__genmod
