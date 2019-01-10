        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:34 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SHP3D__genmod
          INTERFACE 
            SUBROUTINE SHP3D(SS,XSJ,SHP,XL,NDM)
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: SS(3)
              REAL(KIND=8) :: XSJ
              REAL(KIND=8) :: SHP(4,8)
              REAL(KIND=8) :: XL(NDM,8)
            END SUBROUTINE SHP3D
          END INTERFACE 
        END MODULE SHP3D__genmod
