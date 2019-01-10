        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:45 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ELCNT__genmod
          INTERFACE 
            SUBROUTINE ELCNT(NUMNP,NUMEL,NEN,NEIX,IX,IC,FLAG)
              INTEGER(KIND=4) :: NEIX
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NUMEL
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: IX(NEIX,*)
              INTEGER(KIND=4) :: IC(*)
              LOGICAL(KIND=4) :: FLAG
            END SUBROUTINE ELCNT
          END INTERFACE 
        END MODULE ELCNT__genmod
