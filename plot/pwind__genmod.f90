        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:57 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PWIND__genmod
          INTERFACE 
            SUBROUTINE PWIND(X,DR,NDM,NDF,NUMNP)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: X(NDM,NUMNP)
              REAL(KIND=8) :: DR(NDF,NUMNP)
            END SUBROUTINE PWIND
          END INTERFACE 
        END MODULE PWIND__genmod
