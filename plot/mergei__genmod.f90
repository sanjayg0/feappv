        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:44 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MERGEI__genmod
          INTERFACE 
            SUBROUTINE MERGEI(DIR,NIP,IP,NUMA,IPC)
              INTEGER(KIND=4) :: NIP
              INTEGER(KIND=4) :: DIR
              INTEGER(KIND=4) :: IP(NIP,*)
              INTEGER(KIND=4) :: NUMA
              INTEGER(KIND=4) :: IPC(NIP,*)
            END SUBROUTINE MERGEI
          END INTERFACE 
        END MODULE MERGEI__genmod
