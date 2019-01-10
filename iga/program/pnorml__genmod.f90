        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:17 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PNORML__genmod
          INTERFACE 
            SUBROUTINE PNORML(IE,IX,X,NORM,IP,NIE,NDM,NEN,NEN1,NUMNP,   &
     &NUMEL)
              INTEGER(KIND=4) :: NEN1
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NIE
              INTEGER(KIND=4) :: IE(NIE,*)
              INTEGER(KIND=4) :: IX(NEN1,*)
              REAL(KIND=8) :: X(NDM,*)
              REAL(KIND=8) :: NORM(3,*)
              INTEGER(KIND=4) :: IP(*)
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NUMEL
            END SUBROUTINE PNORML
          END INTERFACE 
        END MODULE PNORML__genmod
