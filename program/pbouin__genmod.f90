        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:00 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PBOUIN__genmod
          INTERFACE 
            SUBROUTINE PBOUIN(IDL,ID,PRT,PRTH)
              COMMON/SDATA/ NDF,NDM,NEN1,NST,NNEQ
                INTEGER(KIND=4) :: NDF
                INTEGER(KIND=4) :: NDM
                INTEGER(KIND=4) :: NEN1
                INTEGER(KIND=4) :: NST
                INTEGER(KIND=4) :: NNEQ
              INTEGER(KIND=4) :: IDL(*)
              INTEGER(KIND=4) :: ID(NDF,*)
              LOGICAL(KIND=4) :: PRT
              LOGICAL(KIND=4) :: PRTH
            END SUBROUTINE PBOUIN
          END INTERFACE 
        END MODULE PBOUIN__genmod
