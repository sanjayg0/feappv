        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:23:18 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE UMATL0__genmod
          INTERFACE 
            SUBROUTINE UMATL0(EPS,THETA,TD,D,UD,HN,H1,NH,II,ISTRT,SIG,DD&
     &,ISW)
              INTEGER(KIND=4) :: NH
              REAL(KIND=8) :: EPS(*)
              REAL(KIND=8) :: THETA(*)
              REAL(KIND=8) :: TD
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: UD(*)
              REAL(KIND=8) :: HN(NH)
              REAL(KIND=8) :: H1(NH)
              INTEGER(KIND=4) :: II
              INTEGER(KIND=4) :: ISTRT
              REAL(KIND=8) :: SIG(*)
              REAL(KIND=8) :: DD(6,*)
              INTEGER(KIND=4) :: ISW
            END SUBROUTINE UMATL0
          END INTERFACE 
        END MODULE UMATL0__genmod
