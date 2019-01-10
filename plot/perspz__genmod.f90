        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:45 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PERSPZ__genmod
          INTERFACE 
            SUBROUTINE PERSPZ(X,IX,IP,NEN1,NEN,NDM,NUMNP,NUMEL)
              INTEGER(KIND=4) :: NUMEL
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NEN1
              REAL(KIND=8) :: X(NDM,NUMNP)
              INTEGER(KIND=4) :: IX(NEN1,NUMEL)
              INTEGER(KIND=4) :: IP(NUMEL)
              INTEGER(KIND=4) :: NEN
            END SUBROUTINE PERSPZ
          END INTERFACE 
        END MODULE PERSPZ__genmod
