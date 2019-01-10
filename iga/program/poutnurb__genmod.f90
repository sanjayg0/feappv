        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:19 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE POUTNURB__genmod
          INTERFACE 
            SUBROUTINE POUTNURB(X,WT,L1,L2)
              COMMON/SDATA/ NDF,NDM,NEN1,NST,NNEQ
                INTEGER(KIND=4) :: NDF
                INTEGER(KIND=4) :: NDM
                INTEGER(KIND=4) :: NEN1
                INTEGER(KIND=4) :: NST
                INTEGER(KIND=4) :: NNEQ
              REAL(KIND=8) :: X(NDM,*)
              REAL(KIND=8) :: WT(*)
              INTEGER(KIND=4) :: L1
              INTEGER(KIND=4) :: L2
            END SUBROUTINE POUTNURB
          END INTERFACE 
        END MODULE POUTNURB__genmod
