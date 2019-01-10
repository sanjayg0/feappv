        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:54 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE NODEL__genmod
          INTERFACE 
            SUBROUTINE NODEL(IX,NNID,ND,LN,NE,NUMNP,NUMEL,NSUM,NEN,NEN1)
              INTEGER(KIND=4) :: NEN1
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: IX(NEN1,*)
              INTEGER(KIND=4) :: NNID(NUMNP)
              INTEGER(KIND=4) :: ND(NUMNP)
              INTEGER(KIND=4) :: LN(NUMNP)
              INTEGER(KIND=4) :: NE(*)
              INTEGER(KIND=4) :: NUMEL
              INTEGER(KIND=4) :: NSUM
              INTEGER(KIND=4) :: NEN
            END SUBROUTINE NODEL
          END INTERFACE 
        END MODULE NODEL__genmod
