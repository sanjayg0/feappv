        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:26 2018
        MODULE PSETNURB__genmod
          INTERFACE 
            SUBROUTINE PSETNURB(X,WT,QW,L,LEQ,LINC)
              COMMON/SDATA/ NDF,NDM,NEN1,NST,NNEQ
                INTEGER(KIND=4) :: NDF
                INTEGER(KIND=4) :: NDM
                INTEGER(KIND=4) :: NEN1
                INTEGER(KIND=4) :: NST
                INTEGER(KIND=4) :: NNEQ
              REAL(KIND=8) :: X(NDM,*)
              REAL(KIND=8) :: WT(*)
              REAL(KIND=8) :: QW(NDM+1,*)
              INTEGER(KIND=4) :: L
              INTEGER(KIND=4) :: LEQ
              INTEGER(KIND=4) :: LINC
            END SUBROUTINE PSETNURB
          END INTERFACE 
        END MODULE PSETNURB__genmod
