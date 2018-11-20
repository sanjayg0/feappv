        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:14 2018
        MODULE PSTR_LIN__genmod
          INTERFACE 
            SUBROUTINE PSTR_LIN(IE,IX,X,XL,WT,WTL,IX_LIN,ST,S_LIN,P_LIN,&
     &U,U_LIN,X_LIN)
              COMMON/CDAT1/ NDD,NIE,NUD
                INTEGER(KIND=4) :: NDD
                INTEGER(KIND=4) :: NIE
                INTEGER(KIND=4) :: NUD
              COMMON/CDATA/ NUMNP,NUMEL,NUMMAT,NEN,NEQ,IPR,NETYP
                INTEGER(KIND=4) :: NUMNP
                INTEGER(KIND=4) :: NUMEL
                INTEGER(KIND=4) :: NUMMAT
                INTEGER(KIND=4) :: NEN
                INTEGER(KIND=4) :: NEQ
                INTEGER(KIND=4) :: IPR
                INTEGER(KIND=4) :: NETYP
              COMMON/PNURB/ ND_LIN,NE_LIN
                INTEGER(KIND=4) :: ND_LIN
                INTEGER(KIND=4) :: NE_LIN
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
              REAL(KIND=8) :: ST(NUMNP,*)
              REAL(KIND=8) :: S_LIN(ND_LIN,*)
              REAL(KIND=8) :: P_LIN(ND_LIN,*)
              REAL(KIND=8) :: U(NDF,*)
              REAL(KIND=8) :: U_LIN(NDF,*)
              REAL(KIND=8) :: X_LIN(NDM,*)
            END SUBROUTINE PSTR_LIN
          END INTERFACE 
        END MODULE PSTR_LIN__genmod
