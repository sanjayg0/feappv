        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:34 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SHP2D__genmod
          INTERFACE 
            SUBROUTINE SHP2D(SS,XL,SHP,XSJ,NDM,NEL,IX,FLG)
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: SS(2)
              REAL(KIND=8) :: XL(NDM,*)
              REAL(KIND=8) :: SHP(3,*)
              REAL(KIND=8) :: XSJ
              INTEGER(KIND=4) :: NEL
              INTEGER(KIND=4) :: IX(*)
              LOGICAL(KIND=4) :: FLG
            END SUBROUTINE SHP2D
          END INTERFACE 
        END MODULE SHP2D__genmod
