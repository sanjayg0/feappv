        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:04 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PELCON__genmod
          INTERFACE 
            SUBROUTINE PELCON(NUMEL,NEN,NEIX,IX,IC,IELC,ICNEQ,SGN)
              INTEGER(KIND=4) :: NEIX
              INTEGER(KIND=4) :: NUMEL
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: IX(NEIX,*)
              INTEGER(KIND=4) :: IC(*)
              INTEGER(KIND=4) :: IELC(*)
              INTEGER(KIND=4) :: ICNEQ
              INTEGER(KIND=4) :: SGN
            END SUBROUTINE PELCON
          END INTERFACE 
        END MODULE PELCON__genmod
