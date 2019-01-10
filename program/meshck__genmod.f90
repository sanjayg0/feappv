        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:53 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MESHCK__genmod
          INTERFACE 
            SUBROUTINE MESHCK(IP,IE,IEDOF,ID,NTY,IX,NIE,NEN,NEN1,NDF,   &
     &NUMNP,NUMEL,NUMMAT,ERRS)
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NEN1
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: NIE
              INTEGER(KIND=4) :: IP(NDF,*)
              INTEGER(KIND=4) :: IE(NIE,*)
              INTEGER(KIND=4) :: IEDOF(NDF,NEN,*)
              INTEGER(KIND=4) :: ID(NDF,*)
              INTEGER(KIND=4) :: NTY(*)
              INTEGER(KIND=4) :: IX(NEN1,*)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NUMEL
              INTEGER(KIND=4) :: NUMMAT
              LOGICAL(KIND=4) :: ERRS
            END SUBROUTINE MESHCK
          END INTERFACE 
        END MODULE MESHCK__genmod
