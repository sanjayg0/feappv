        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:48 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PLFACN__genmod
          INTERFACE 
            SUBROUTINE PLFACN(IX,IA,NEN,NUMEL,NFACE,IE,NIE)
              COMMON/SDATA/ NDF,NDM,NEN1,NST,NNEQ
                INTEGER(KIND=4) :: NDF
                INTEGER(KIND=4) :: NDM
                INTEGER(KIND=4) :: NEN1
                INTEGER(KIND=4) :: NST
                INTEGER(KIND=4) :: NNEQ
              INTEGER(KIND=4) :: NIE
              INTEGER(KIND=4) :: NUMEL
              INTEGER(KIND=4) :: IX(NEN1,NUMEL)
              INTEGER(KIND=4) :: IA(*)
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: NFACE
              INTEGER(KIND=4) :: IE(NIE,*)
            END SUBROUTINE PLFACN
          END INTERFACE 
        END MODULE PLFACN__genmod
