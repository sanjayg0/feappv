        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
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
