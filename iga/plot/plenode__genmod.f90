        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PLENODE__genmod
          INTERFACE 
            SUBROUTINE PLENODE(CT,IE,IX,X,XBEZ,WBEZ,IX_BEZ,IP_BEZ,IP)
              COMMON/CDAT1/ NDD,NIE,NUD
                INTEGER(KIND=4) :: NDD
                INTEGER(KIND=4) :: NIE
                INTEGER(KIND=4) :: NUD
              COMMON/INURBP/ NUMPLN,NNPL
                INTEGER(KIND=4) :: NUMPLN
                INTEGER(KIND=4) :: NNPL
              COMMON/SDATA/ NDF,NDM,NEN1,NST,NNEQ
                INTEGER(KIND=4) :: NDF
                INTEGER(KIND=4) :: NDM
                INTEGER(KIND=4) :: NEN1
                INTEGER(KIND=4) :: NST
                INTEGER(KIND=4) :: NNEQ
              REAL(KIND=8) :: CT(3)
              INTEGER(KIND=4) :: IE(NIE,*)
              INTEGER(KIND=4) :: IX(NEN1,*)
              REAL(KIND=8) :: X(NDM,*)
              REAL(KIND=8) :: XBEZ(NDM,*)
              REAL(KIND=8) :: WBEZ(*)
              INTEGER(KIND=4) :: IX_BEZ(NNPL+1,*)
              INTEGER(KIND=4) :: IP_BEZ(3,*)
              INTEGER(KIND=4) :: IP(*)
            END SUBROUTINE PLENODE
          END INTERFACE 
        END MODULE PLENODE__genmod
