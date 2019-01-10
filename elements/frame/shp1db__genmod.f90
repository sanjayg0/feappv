        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:00 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SHP1DB__genmod
          INTERFACE 
            SUBROUTINE SHP1DB(S,XL,SHP,NDM,NEL,XAJ)
              INTEGER(KIND=4) :: NEL
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: S
              REAL(KIND=8) :: XL(NDM,NEL)
              REAL(KIND=8) :: SHP(2,NEL)
              REAL(KIND=8) :: XAJ
            END SUBROUTINE SHP1DB
          END INTERFACE 
        END MODULE SHP1DB__genmod
