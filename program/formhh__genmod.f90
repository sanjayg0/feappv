        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:47 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FORMHH__genmod
          INTERFACE 
            SUBROUTINE FORMHH(HH,G,NEQG,NEQ)
              INTEGER(KIND=4) :: NEQ
              INTEGER(KIND=4) :: NEQG
              REAL(KIND=8) :: HH(NEQG,NEQG)
              REAL(KIND=8) :: G(NEQ,NEQG,2)
            END SUBROUTINE FORMHH
          END INTERFACE 
        END MODULE FORMHH__genmod
