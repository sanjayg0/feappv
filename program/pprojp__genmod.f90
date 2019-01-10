        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:20 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PPROJP__genmod
          INTERFACE 
            SUBROUTINE PPROJP(IXL,XL,XS,P,NDM,NDF,NEL)
              INTEGER(KIND=4) :: NEL
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: IXL(NDF,*)
              REAL(KIND=8) :: XL(NDM,NEL)
              REAL(KIND=8) :: XS(NDM,NEL)
              REAL(KIND=8) :: P(NDF,NEL)
            END SUBROUTINE PPROJP
          END INTERFACE 
        END MODULE PPROJP__genmod
