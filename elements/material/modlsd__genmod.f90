        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:06 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MODLSD__genmod
          INTERFACE 
            SUBROUTINE MODLSD(II,D,TA,EPS,H1,H2,NH,ISTRT,DD,SIG,ISW)
              INTEGER(KIND=4) :: II
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: TA
              REAL(KIND=8) :: EPS(9,*)
              REAL(KIND=8) :: H1(*)
              REAL(KIND=8) :: H2(*)
              INTEGER(KIND=4) :: NH
              INTEGER(KIND=4) :: ISTRT
              REAL(KIND=8) :: DD(6,6,5)
              REAL(KIND=8) :: SIG(*)
              INTEGER(KIND=4) :: ISW
            END SUBROUTINE MODLSD
          END INTERFACE 
        END MODULE MODLSD__genmod
