        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:59 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE XPLINE__genmod
          INTERFACE 
            SUBROUTINE XPLINE(X,IE,IX,ID,IC,IP,NUMNP,NUMEL,NDM,NEN1,NEN,&
     &NIE,CT,ISW)
              INTEGER(KIND=4) :: NIE
              INTEGER(KIND=4) :: NEN1
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: X(NDM,*)
              INTEGER(KIND=4) :: IE(NIE,*)
              INTEGER(KIND=4) :: IX(NEN1,*)
              INTEGER(KIND=4) :: ID(*)
              INTEGER(KIND=4) :: IC(*)
              INTEGER(KIND=4) :: IP(*)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NUMEL
              INTEGER(KIND=4) :: NEN
              REAL(KIND=8) :: CT
              LOGICAL(KIND=4) :: ISW
            END SUBROUTINE XPLINE
          END INTERFACE 
        END MODULE XPLINE__genmod
