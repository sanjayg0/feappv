        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:27 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PTANG__genmod
          INTERFACE 
            SUBROUTINE PTANG(G,HT,NEQ,NSS)
              INTEGER(KIND=4) :: NSS
              INTEGER(KIND=4) :: NEQ
              REAL(KIND=8) :: G(NEQ,NSS)
              REAL(KIND=8) :: HT(NSS,NSS)
            END SUBROUTINE PTANG
          END INTERFACE 
        END MODULE PTANG__genmod
