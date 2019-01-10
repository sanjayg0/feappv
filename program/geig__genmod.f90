        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:48 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GEIG__genmod
          INTERFACE 
            SUBROUTINE GEIG(G,H,D,P,T,NV,NVS,PRT)
              INTEGER(KIND=4) :: NV
              REAL(KIND=8) :: G(*)
              REAL(KIND=8) :: H(*)
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: P(NV,*)
              REAL(KIND=8) :: T(*)
              INTEGER(KIND=4) :: NVS
              LOGICAL(KIND=4) :: PRT
            END SUBROUTINE GEIG
          END INTERFACE 
        END MODULE GEIG__genmod
