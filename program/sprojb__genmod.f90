        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:35 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SPROJB__genmod
          INTERFACE 
            SUBROUTINE SPROJB(B,V,T,H,NEQ,NV,IMAS)
              INTEGER(KIND=4) :: NEQ
              REAL(KIND=8) :: B(*)
              REAL(KIND=8) :: V(NEQ,*)
              REAL(KIND=8) :: T(*)
              REAL(KIND=8) :: H(*)
              INTEGER(KIND=4) :: NV
              INTEGER(KIND=4) :: IMAS
            END SUBROUTINE SPROJB
          END INTERFACE 
        END MODULE SPROJB__genmod
