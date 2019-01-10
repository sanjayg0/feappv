        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:52 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PLTELC__genmod
          INTERFACE 
            SUBROUTINE PLTELC(X,IE,IX,IP,DT,ST,VV,NIE,NDM,NDF,NEN1,IC,MC&
     &,LC,MMC,LABEL)
              COMMON/CDATA/ NUMNP,NUMEL,NUMMAT,NEN,NEQ,IPR,NETYP
                INTEGER(KIND=4) :: NUMNP
                INTEGER(KIND=4) :: NUMEL
                INTEGER(KIND=4) :: NUMMAT
                INTEGER(KIND=4) :: NEN
                INTEGER(KIND=4) :: NEQ
                INTEGER(KIND=4) :: IPR
                INTEGER(KIND=4) :: NETYP
              INTEGER(KIND=4) :: NEN1
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NIE
              REAL(KIND=8) :: X(NDM,*)
              INTEGER(KIND=4) :: IE(NIE,*)
              INTEGER(KIND=4) :: IX(NEN1,*)
              INTEGER(KIND=4) :: IP(*)
              REAL(KIND=8) :: DT(*)
              REAL(KIND=8) :: ST(NUMNP,*)
              REAL(KIND=8) :: VV(NEN,*)
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: IC
              INTEGER(KIND=4) :: MC
              INTEGER(KIND=4) :: LC
              INTEGER(KIND=4) :: MMC
              LOGICAL(KIND=4) :: LABEL
            END SUBROUTINE PLTELC
          END INTERFACE 
        END MODULE PLTELC__genmod
