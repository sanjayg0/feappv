        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SHPSPQ__genmod
          INTERFACE 
            SUBROUTINE SHPSPQ(XI,XL,SHP,SHPN,SHPM,XSJ,JAC,JINV,NDM)
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: XI(2)
              REAL(KIND=8) :: XL(NDM,4)
              REAL(KIND=8) :: SHP(3,4)
              REAL(KIND=8) :: SHPN(3)
              REAL(KIND=8) :: SHPM(3,4)
              REAL(KIND=8) :: XSJ
              REAL(KIND=8) :: JAC(2,2)
              REAL(KIND=8) :: JINV(2,2)
            END SUBROUTINE SHPSPQ
          END INTERFACE 
        END MODULE SHPSPQ__genmod
