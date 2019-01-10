        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PMSH_LIN__genmod
          INTERFACE 
            SUBROUTINE PMSH_LIN(IE,IX,X,XL,WT,WTL,IX_LIN,X_LIN,ND_L,NE_L&
     &)
              COMMON/CDAT1/ NDD,NIE,NUD
                INTEGER(KIND=4) :: NDD
                INTEGER(KIND=4) :: NIE
                INTEGER(KIND=4) :: NUD
              COMMON/SDATA/ NDF,NDM,NEN1,NST,NNEQ
                INTEGER(KIND=4) :: NDF
                INTEGER(KIND=4) :: NDM
                INTEGER(KIND=4) :: NEN1
                INTEGER(KIND=4) :: NST
                INTEGER(KIND=4) :: NNEQ
              INTEGER(KIND=4) :: IE(NIE,*)
              INTEGER(KIND=4) :: IX(NEN1,*)
              REAL(KIND=8) :: X(NDM,*)
              REAL(KIND=8) :: XL(NDM,*)
              REAL(KIND=8) :: WT(*)
              REAL(KIND=8) :: WTL(*)
              INTEGER(KIND=4) :: IX_LIN(19,*)
              REAL(KIND=8) :: X_LIN(NDM,*)
              INTEGER(KIND=4) :: ND_L
              INTEGER(KIND=4) :: NE_L
            END SUBROUTINE PMSH_LIN
          END INTERFACE 
        END MODULE PMSH_LIN__genmod
