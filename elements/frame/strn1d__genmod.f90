        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:05 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE STRN1D__genmod
          INTERFACE 
            SUBROUTINE STRN1D(D,XL,UL,TL,NDM,NDF,NEN,XLEN,XLEN0,XX,EPS, &
     &TA,NONLIN,ISW)
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: XL(NDM,*)
              REAL(KIND=8) :: UL(NDF,NEN,*)
              REAL(KIND=8) :: TL(*)
              REAL(KIND=8) :: XLEN
              REAL(KIND=8) :: XLEN0
              REAL(KIND=8) :: XX(3)
              REAL(KIND=8) :: EPS(*)
              REAL(KIND=8) :: TA
              LOGICAL(KIND=4) :: NONLIN
              INTEGER(KIND=4) :: ISW
            END SUBROUTINE STRN1D
          END INTERFACE 
        END MODULE STRN1D__genmod
