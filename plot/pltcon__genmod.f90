        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:51 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PLTCON__genmod
          INTERFACE 
            SUBROUTINE PLTCON(X,IE,IX,IP,U,NIE,NDM,NDF,NEN1,NEN0,IC,MC, &
     &LC,MMC,LABEL)
              INTEGER(KIND=4) :: NEN1
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NIE
              REAL(KIND=8) :: X(NDM,*)
              INTEGER(KIND=4) :: IE(NIE,*)
              INTEGER(KIND=4) :: IX(NEN1,*)
              INTEGER(KIND=4) :: IP(*)
              REAL(KIND=8) :: U(*)
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NEN0
              INTEGER(KIND=4) :: IC
              INTEGER(KIND=4) :: MC
              INTEGER(KIND=4) :: LC
              INTEGER(KIND=4) :: MMC
              LOGICAL(KIND=4) :: LABEL
            END SUBROUTINE PLTCON
          END INTERFACE 
        END MODULE PLTCON__genmod
