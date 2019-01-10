        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:49 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PLFACX__genmod
          INTERFACE 
            SUBROUTINE PLFACX(IX,IA,IXF,NEN,NUMEL,IE,NIE)
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
              INTEGER(KIND=4) :: IXF(7,*)
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: IE(NIE,*)
            END SUBROUTINE PLFACX
          END INTERFACE 
        END MODULE PLFACX__genmod
