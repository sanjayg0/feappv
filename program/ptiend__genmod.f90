        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:27 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PTIEND__genmod
          INTERFACE 
            SUBROUTINE PTIEND(IE,IX,IB,IP,X,MA,NIE,NEN,NEN1,NDM,NUMEL)
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NEN1
              INTEGER(KIND=4) :: NIE
              INTEGER(KIND=4) :: IE(NIE,*)
              INTEGER(KIND=4) :: IX(NEN1,*)
              INTEGER(KIND=4) :: IB(*)
              INTEGER(KIND=4) :: IP(*)
              REAL(KIND=8) :: X(NDM,*)
              INTEGER(KIND=4) :: MA
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: NUMEL
            END SUBROUTINE PTIEND
          END INTERFACE 
        END MODULE PTIEND__genmod
