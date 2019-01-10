        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:00 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PCBOUN__genmod
          INTERFACE 
            SUBROUTINE PCBOUN(TD,X,ID,NTYP,NDM,NDF,NUMNP,NUMPRT,GAP0,   &
     &VTYPE,PRT,PRTH,ANAME)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: TD(*)
              REAL(KIND=8) :: X(NDM,NUMNP)
              INTEGER(KIND=4) :: ID(NDF,NUMNP)
              INTEGER(KIND=4) :: NTYP(*)
              INTEGER(KIND=4) :: NUMPRT
              REAL(KIND=8) :: GAP0
              CHARACTER(LEN=4) :: VTYPE
              LOGICAL(KIND=4) :: PRT
              LOGICAL(KIND=4) :: PRTH
              CHARACTER(*) :: ANAME
            END SUBROUTINE PCBOUN
          END INTERFACE 
        END MODULE PCBOUN__genmod
