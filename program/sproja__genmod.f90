        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:35 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SPROJA__genmod
          INTERFACE 
            SUBROUTINE SPROJA(V,T,G,NEQ,NV)
              INTEGER(KIND=4) :: NEQ
              REAL(KIND=8) :: V(NEQ,*)
              REAL(KIND=8) :: T(NEQ)
              REAL(KIND=8) :: G(*)
              INTEGER(KIND=4) :: NV
            END SUBROUTINE SPROJA
          END INTERFACE 
        END MODULE SPROJA__genmod
