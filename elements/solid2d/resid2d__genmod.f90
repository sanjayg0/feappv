        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:24 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE RESID2D__genmod
          INTERFACE 
            SUBROUTINE RESID2D(CFAC,LFAC,XSJ,XSJ0,SHP,EPS,SIG,D,VL,AL,P,&
     &NDF,L)
              INTEGER(KIND=4) :: NDF
              REAL(KIND=8) :: CFAC
              REAL(KIND=8) :: LFAC
              REAL(KIND=8) :: XSJ
              REAL(KIND=8) :: XSJ0
              REAL(KIND=8) :: SHP(3,*)
              REAL(KIND=8) :: EPS(*)
              REAL(KIND=8) :: SIG(*)
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: VL(NDF,*)
              REAL(KIND=8) :: AL(NDF,*)
              REAL(KIND=8) :: P(NDF,*)
              INTEGER(KIND=4) :: L
            END SUBROUTINE RESID2D
          END INTERFACE 
        END MODULE RESID2D__genmod
