        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:20 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE POUTIE__genmod
          INTERFACE 
            SUBROUTINE POUTIE(ITIE,IX,NTY,NEN,NEN1,NUMNP,NUMEL,PRT)
              INTEGER(KIND=4) :: NEN1
              INTEGER(KIND=4) :: ITIE(*)
              INTEGER(KIND=4) :: IX(NEN1,*)
              INTEGER(KIND=4) :: NTY(*)
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NUMEL
              LOGICAL(KIND=4) :: PRT
            END SUBROUTINE POUTIE
          END INTERFACE 
        END MODULE POUTIE__genmod
