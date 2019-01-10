        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:33 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SHP1D__genmod
          INTERFACE 
            SUBROUTINE SHP1D(S,XL,SHP,NDM,NEL,XJAC)
              INTEGER(KIND=4) :: NEL
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: S
              REAL(KIND=8) :: XL(NDM,NEL)
              REAL(KIND=8) :: SHP(2,NEL)
              REAL(KIND=8) :: XJAC
            END SUBROUTINE SHP1D
          END INTERFACE 
        END MODULE SHP1D__genmod
