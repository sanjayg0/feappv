        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:13 2018
        MODULE PEIG_LIN__genmod
          INTERFACE 
            SUBROUTINE PEIG_LIN(IE,IX,X,XL,WT,WTL,X_LIN)
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
              REAL(KIND=8) :: X_LIN(NDM,*)
            END SUBROUTINE PEIG_LIN
          END INTERFACE 
        END MODULE PEIG_LIN__genmod
