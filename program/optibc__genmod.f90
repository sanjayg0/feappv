        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:55 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE OPTIBC__genmod
          INTERFACE 
            SUBROUTINE OPTIBC(ID,NNID,NDF,NUMNP)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: ID(NDF,NUMNP)
              INTEGER(KIND=4) :: NNID(NUMNP)
            END SUBROUTINE OPTIBC
          END INTERFACE 
        END MODULE OPTIBC__genmod
