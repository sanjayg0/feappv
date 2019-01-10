        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:03 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PEFORC__genmod
          INTERFACE 
            SUBROUTINE PEFORC(X,F,NDM,NDF,NUMNP,VTYPE,PRT,PRTH,FNAME)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: X(NDM,NUMNP)
              REAL(KIND=8) :: F(NDF,NUMNP)
              CHARACTER(LEN=4) :: VTYPE
              LOGICAL(KIND=4) :: PRT
              LOGICAL(KIND=4) :: PRTH
              CHARACTER(LEN=5) :: FNAME
            END SUBROUTINE PEFORC
          END INTERFACE 
        END MODULE PEFORC__genmod
