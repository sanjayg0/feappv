        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PLINK__genmod
          INTERFACE 
            SUBROUTINE PLINK(ID,X,NDM,NDF,NUMNP,NEQ,PRT)
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: ID(NDF,*)
              REAL(KIND=8) :: X(NDM,*)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NEQ
              LOGICAL(KIND=4) :: PRT
            END SUBROUTINE PLINK
          END INTERFACE 
        END MODULE PLINK__genmod
