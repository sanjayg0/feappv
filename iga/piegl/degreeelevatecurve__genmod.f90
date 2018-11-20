        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:11 2018
        MODULE DEGREEELEVATECURVE__genmod
          INTERFACE 
            SUBROUTINE DEGREEELEVATECURVE(NP,PP,UP,PW,T,QW,UQ,PQ,ND1)
              INTEGER(KIND=4) :: ND1
              INTEGER(KIND=4) :: T
              INTEGER(KIND=4) :: PP
              INTEGER(KIND=4) :: NP
              REAL(KIND=8) :: UP(0:*)
              REAL(KIND=8) :: PW(ND1,0:*)
              REAL(KIND=8) :: QW(ND1,0:*)
              REAL(KIND=8) :: UQ(0:*)
              INTEGER(KIND=4) :: PQ
            END SUBROUTINE DEGREEELEVATECURVE
          END INTERFACE 
        END MODULE DEGREEELEVATECURVE__genmod
