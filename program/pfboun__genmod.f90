        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:07 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PFBOUN__genmod
          INTERFACE 
            SUBROUTINE PFBOUN(TD,X,F,NTYP,NDM,NDF,NUMNP,NUMPRT,VTYPE,PRT&
     &,PRTH)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: TD(*)
              REAL(KIND=8) :: X(NDM,NUMNP)
              REAL(KIND=8) :: F(NDF,NUMNP)
              INTEGER(KIND=4) :: NTYP(*)
              INTEGER(KIND=4) :: NUMPRT
              CHARACTER(LEN=4) :: VTYPE
              LOGICAL(KIND=4) :: PRT
              LOGICAL(KIND=4) :: PRTH
            END SUBROUTINE PFBOUN
          END INTERFACE 
        END MODULE PFBOUN__genmod
