        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:21 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PPROJPP__genmod
          INTERFACE 
            SUBROUTINE PPROJPP(IXL,XL,XS,P,S,G,HT,NDM,NDF,NEL,NST,NEQ,  &
     &NSS)
              INTEGER(KIND=4) :: NSS
              INTEGER(KIND=4) :: NEQ
              INTEGER(KIND=4) :: NST
              INTEGER(KIND=4) :: NEL
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: IXL(NDF,*)
              REAL(KIND=8) :: XL(NDM,NEL)
              REAL(KIND=8) :: XS(NDM,NEL)
              REAL(KIND=8) :: P(NDF,NEL)
              REAL(KIND=8) :: S(NST,NST)
              REAL(KIND=8) :: G(NEQ,NSS)
              REAL(KIND=8) :: HT(NSS,NSS)
            END SUBROUTINE PPROJPP
          END INTERFACE 
        END MODULE PPROJPP__genmod
