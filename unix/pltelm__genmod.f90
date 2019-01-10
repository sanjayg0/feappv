        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:23:03 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PLTELM__genmod
          INTERFACE 
            SUBROUTINE PLTELM(X,IE,IX,PSCALE,NIE,NDM,NEN1,N1,N2)
              INTEGER(KIND=4) :: NEN1
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NIE
              REAL(KIND=8) :: X(NDM,*)
              INTEGER(KIND=4) :: IE(NIE,*)
              INTEGER(KIND=4) :: IX(NEN1,*)
              REAL(KIND=8) :: PSCALE
              INTEGER(KIND=4) :: N1
              INTEGER(KIND=4) :: N2
            END SUBROUTINE PLTELM
          END INTERFACE 
        END MODULE PLTELM__genmod
