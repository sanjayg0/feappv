        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:29 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE RESID3D__genmod
          INTERFACE 
            SUBROUTINE RESID3D(XSJ,SHP,SIG,D,VL,AL,P,NDF,L)
              INTEGER(KIND=4) :: NDF
              REAL(KIND=8) :: XSJ
              REAL(KIND=8) :: SHP(4,*)
              REAL(KIND=8) :: SIG(*)
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: VL(NDF,*)
              REAL(KIND=8) :: AL(NDF,*)
              REAL(KIND=8) :: P(NDF,*)
              INTEGER(KIND=4) :: L
            END SUBROUTINE RESID3D
          END INTERFACE 
        END MODULE RESID3D__genmod
