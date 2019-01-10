        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:59 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PBLKTYP__genmod
          INTERFACE 
            FUNCTION PBLKTYP(LAYER,TD,NTYP,NS,MAB)
              CHARACTER(LEN=15) :: LAYER
              REAL(KIND=8) :: TD(5)
              INTEGER(KIND=4) :: NTYP
              INTEGER(KIND=4) :: NS
              INTEGER(KIND=4) :: MAB
              LOGICAL(KIND=4) :: PBLKTYP
            END FUNCTION PBLKTYP
          END INTERFACE 
        END MODULE PBLKTYP__genmod
