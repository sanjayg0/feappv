        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:49 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PLINE__genmod
          INTERFACE 
            SUBROUTINE PLINE(X,IE,IX,ID,IP,NUMNP,NUMEL,NDM,NEN1,NEN,NIE,&
     &CT,ISW)
              REAL(KIND=8) :: X(*)
              INTEGER(KIND=4) :: IE(*)
              INTEGER(KIND=4) :: IX(*)
              INTEGER(KIND=4) :: ID(*)
              INTEGER(KIND=4) :: IP(*)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NUMEL
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NEN1
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: NIE
              REAL(KIND=8) :: CT(*)
              LOGICAL(KIND=4) :: ISW
            END SUBROUTINE PLINE
          END INTERFACE 
        END MODULE PLINE__genmod
