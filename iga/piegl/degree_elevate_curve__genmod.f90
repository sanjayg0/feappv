        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:08 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE DEGREE_ELEVATE_CURVE__genmod
          INTERFACE 
            SUBROUTINE DEGREE_ELEVATE_CURVE(NP,PP,UP,PW,T,QW,UQ,PQ,ND1)
              INTEGER(KIND=4) :: ND1
              INTEGER(KIND=4) :: T
              INTEGER(KIND=4) :: PP
              INTEGER(KIND=4) :: NP
              REAL(KIND=8) :: UP(*)
              REAL(KIND=8) :: PW(ND1,*)
              REAL(KIND=8) :: QW(ND1,*)
              REAL(KIND=8) :: UQ(*)
              INTEGER(KIND=4) :: PQ
            END SUBROUTINE DEGREE_ELEVATE_CURVE
          END INTERFACE 
        END MODULE DEGREE_ELEVATE_CURVE__genmod
