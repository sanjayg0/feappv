        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:12 2018
        MODULE PDIS_LIN__genmod
          INTERFACE 
            SUBROUTINE PDIS_LIN(IE,IX,X,XL,WT,WTL,U,U_LIN,X_LIN)
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
              REAL(KIND=8) :: U(NDF,*)
              REAL(KIND=8) :: U_LIN(NDF,*)
              REAL(KIND=8) :: X_LIN(NDM,*)
            END SUBROUTINE PDIS_LIN
          END INTERFACE 
        END MODULE PDIS_LIN__genmod
