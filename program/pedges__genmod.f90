        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:03 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PEDGES__genmod
          INTERFACE 
            SUBROUTINE PEDGES(X,ID,NDM,NDF,NUMNP,VTYPE,PRT,PRTH,ENAME)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: X(NDM,NUMNP)
              INTEGER(KIND=4) :: ID(NDF,NUMNP)
              CHARACTER(LEN=4) :: VTYPE
              LOGICAL(KIND=4) :: PRT
              LOGICAL(KIND=4) :: PRTH
              CHARACTER(*) :: ENAME
            END SUBROUTINE PEDGES
          END INTERFACE 
        END MODULE PEDGES__genmod
