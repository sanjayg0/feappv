        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:07 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CURVEKNOTINS__genmod
          INTERFACE 
            SUBROUTINE CURVEKNOTINS(NP,P,UP,PW,UU,K,S,R,NQ,UQ,QW,NDM)
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: P
              INTEGER(KIND=4) :: NP
              REAL(KIND=8) :: UP(0:*)
              REAL(KIND=8) :: PW(NDM+1,0:*)
              REAL(KIND=8) :: UU
              INTEGER(KIND=4) :: K
              INTEGER(KIND=4) :: S
              INTEGER(KIND=4) :: R
              INTEGER(KIND=4) :: NQ
              REAL(KIND=8) :: UQ(0:*)
              REAL(KIND=8) :: QW(NDM+1,0:*)
            END SUBROUTINE CURVEKNOTINS
          END INTERFACE 
        END MODULE CURVEKNOTINS__genmod
