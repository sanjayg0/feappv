        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:57 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PANGL__genmod
          INTERFACE 
            SUBROUTINE PANGL(IX,NEN,ANGL,ANGG,NROT)
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: IX(NEN)
              REAL(KIND=8) :: ANGL(NEN)
              REAL(KIND=8) :: ANGG(*)
              INTEGER(KIND=4) :: NROT
            END SUBROUTINE PANGL
          END INTERFACE 
        END MODULE PANGL__genmod
