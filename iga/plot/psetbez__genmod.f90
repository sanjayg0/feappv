        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:14 2018
        MODULE PSETBEZ__genmod
          INTERFACE 
            SUBROUTINE PSETBEZ(XB,WB,XBEZ,WBEZ,IXBEZ,NLL,ND_BEZ,NMAT,   &
     &NE_BEZ,MA)
              COMMON/INURBP/ NUMPLN,NNPL
                INTEGER(KIND=4) :: NUMPLN
                INTEGER(KIND=4) :: NNPL
              COMMON/SDATA/ NDF,NDM,NEN1,NST,NNEQ
                INTEGER(KIND=4) :: NDF
                INTEGER(KIND=4) :: NDM
                INTEGER(KIND=4) :: NEN1
                INTEGER(KIND=4) :: NST
                INTEGER(KIND=4) :: NNEQ
              REAL(KIND=8) :: XB(NDM,*)
              REAL(KIND=8) :: WB(*)
              REAL(KIND=8) :: XBEZ(NDM,*)
              REAL(KIND=8) :: WBEZ(*)
              INTEGER(KIND=4) :: IXBEZ(NNPL+1,*)
              INTEGER(KIND=4) :: NLL
              INTEGER(KIND=4) :: ND_BEZ
              INTEGER(KIND=4) :: NMAT(*)
              INTEGER(KIND=4) :: NE_BEZ
              INTEGER(KIND=4) :: MA
            END SUBROUTINE PSETBEZ
          END INTERFACE 
        END MODULE PSETBEZ__genmod
