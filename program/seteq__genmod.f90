        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:31 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SETEQ__genmod
          INTERFACE 
            SUBROUTINE SETEQ(ID,NDF,NDM,NUMNP,NEQ,PRT)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: ID(NDF,NUMNP)
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NEQ
              LOGICAL(KIND=4) :: PRT
            END SUBROUTINE SETEQ
          END INTERFACE 
        END MODULE SETEQ__genmod
