        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:23:22 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE UMODEL__genmod
          INTERFACE 
            SUBROUTINE UMODEL(UMAT,EPS,THETA,TD,D,UD,HN,H1,NH,II,ISTRT, &
     &SIG,DD,ISW)
              INTEGER(KIND=4) :: UMAT
              REAL(KIND=8) :: EPS(*)
              REAL(KIND=8) :: THETA(*)
              REAL(KIND=8) :: TD
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: UD(*)
              REAL(KIND=8) :: HN(*)
              REAL(KIND=8) :: H1(*)
              INTEGER(KIND=4) :: NH
              INTEGER(KIND=4) :: II
              INTEGER(KIND=4) :: ISTRT
              REAL(KIND=8) :: SIG(*)
              REAL(KIND=8) :: DD(*)
              INTEGER(KIND=4) :: ISW
            END SUBROUTINE UMODEL
          END INTERFACE 
        END MODULE UMODEL__genmod
