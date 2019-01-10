        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:02 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PCPROP__genmod
          INTERFACE 
            SUBROUTINE PCPROP(TD,X,ICD,NTYP,NDM,NDF,NUMNP,NUMPRT,PRT,   &
     &PRTH)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: TD(*)
              REAL(KIND=8) :: X(NDM,NUMNP)
              INTEGER(KIND=4) :: ICD(NDF,*)
              INTEGER(KIND=4) :: NTYP(*)
              INTEGER(KIND=4) :: NUMPRT
              LOGICAL(KIND=4) :: PRT
              LOGICAL(KIND=4) :: PRTH
            END SUBROUTINE PCPROP
          END INTERFACE 
        END MODULE PCPROP__genmod
