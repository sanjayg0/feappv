        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:19 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE RESID1D__genmod
          INTERFACE 
            SUBROUTINE RESID1D(CFAC,LFAC,XSJ,XSJ0,SHP,SIG,D,VL,AL,P,NDF)
              INTEGER(KIND=4) :: NDF
              REAL(KIND=8) :: CFAC
              REAL(KIND=8) :: LFAC
              REAL(KIND=8) :: XSJ
              REAL(KIND=8) :: XSJ0
              REAL(KIND=8) :: SHP(2,*)
              REAL(KIND=8) :: SIG(*)
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: VL(NDF,*)
              REAL(KIND=8) :: AL(NDF,*)
              REAL(KIND=8) :: P(NDF,*)
            END SUBROUTINE RESID1D
          END INTERFACE 
        END MODULE RESID1D__genmod
