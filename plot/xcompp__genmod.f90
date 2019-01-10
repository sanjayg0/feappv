        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:59 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE XCOMPP__genmod
          INTERFACE 
            SUBROUTINE XCOMPP(IE,IX,ID,NIE,NEN1,NEN,NUMNP,NUMEL)
              INTEGER(KIND=4) :: NEN1
              INTEGER(KIND=4) :: NIE
              INTEGER(KIND=4) :: IE(NIE,*)
              INTEGER(KIND=4) :: IX(NEN1,*)
              INTEGER(KIND=4) :: ID(*)
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NUMEL
            END SUBROUTINE XCOMPP
          END INTERFACE 
        END MODULE XCOMPP__genmod
