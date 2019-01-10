        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:32 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SETHIS__genmod
          INTERFACE 
            SUBROUTINE SETHIS(IE,IX,NIE,NEN,NEN1,NUMEL,NUMMAT,PRT)
              INTEGER(KIND=4) :: NEN1
              INTEGER(KIND=4) :: NIE
              INTEGER(KIND=4) :: IE(NIE,*)
              INTEGER(KIND=4) :: IX(NEN1,*)
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: NUMEL
              INTEGER(KIND=4) :: NUMMAT
              LOGICAL(KIND=4) :: PRT
            END SUBROUTINE SETHIS
          END INTERFACE 
        END MODULE SETHIS__genmod
