        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:42 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE DFIND__genmod
          INTERFACE 
            SUBROUTINE DFIND(AD,JP,D,RI,R0,NUPD,G0,G,S,NEQ,V,W,NBFGS)
              REAL(KIND=8) :: AD(*)
              INTEGER(KIND=4) :: JP(*)
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: RI(*)
              REAL(KIND=8) :: R0(*)
              INTEGER(KIND=4) :: NUPD
              REAL(KIND=8) :: G0
              REAL(KIND=8) :: G
              REAL(KIND=8) :: S
              INTEGER(KIND=4) :: NEQ
              REAL(KIND=8) :: V(*)
              REAL(KIND=8) :: W(*)
              INTEGER(KIND=4) :: NBFGS
            END SUBROUTINE DFIND
          END INTERFACE 
        END MODULE DFIND__genmod
