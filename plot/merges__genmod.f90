        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:44 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MERGES__genmod
          INTERFACE 
            SUBROUTINE MERGES(DIR,ZA,NIP,IP,NUMA,IC)
              INTEGER(KIND=4) :: NIP
              INTEGER(KIND=4) :: DIR
              REAL(KIND=4) :: ZA(*)
              INTEGER(KIND=4) :: IP(NIP,*)
              INTEGER(KIND=4) :: NUMA
              INTEGER(KIND=4) :: IC(*)
            END SUBROUTINE MERGES
          END INTERFACE 
        END MODULE MERGES__genmod
