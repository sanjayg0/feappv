        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:52 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ITERAT__genmod
          INTERFACE 
            SUBROUTINE ITERAT(AD,JP,PU,PRSD,OLDRSD,D,T,ACCRCY,V,W,PRT,ID&
     &,NBFGS,STOL,ETOL)
              REAL(KIND=8) :: AD(*)
              INTEGER(KIND=4) :: JP(*)
              INTEGER(KIND=8) :: PU
              INTEGER(KIND=8) :: PRSD
              REAL(KIND=8) :: OLDRSD(*)
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: T(*)
              LOGICAL(KIND=4) :: ACCRCY
              REAL(KIND=8) :: V(*)
              REAL(KIND=8) :: W(*)
              LOGICAL(KIND=4) :: PRT
              INTEGER(KIND=4) :: ID(*)
              INTEGER(KIND=4) :: NBFGS
              REAL(KIND=8) :: STOL
              REAL(KIND=8) :: ETOL
            END SUBROUTINE ITERAT
          END INTERFACE 
        END MODULE ITERAT__genmod
