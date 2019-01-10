        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE BMATPQ__genmod
          INTERFACE 
            SUBROUTINE BMATPQ(XI,XL,SHP,SHPN,SHPM,SI,CO,JAC0,JINV,XSJ,  &
     &BW_S,BT_B,BB_B,BWT_S,NS,NDM)
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: XI(2)
              REAL(KIND=8) :: XL(NDM,*)
              REAL(KIND=8) :: SHP(3,4)
              REAL(KIND=8) :: SHPN(3)
              REAL(KIND=8) :: SHPM(3,4)
              REAL(KIND=8) :: SI(4)
              REAL(KIND=8) :: CO(4)
              REAL(KIND=8) :: JAC0(2,2)
              REAL(KIND=8) :: JINV(2,2)
              REAL(KIND=8) :: XSJ
              REAL(KIND=8) :: BW_S(2,3,4)
              REAL(KIND=8) :: BT_B(3,3,4)
              REAL(KIND=8) :: BB_B(3,*)
              REAL(KIND=8) :: BWT_S(2,3,4)
              REAL(KIND=8) :: NS(2,*)
            END SUBROUTINE BMATPQ
          END INTERFACE 
        END MODULE BMATPQ__genmod
