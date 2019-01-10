        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:39 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE TJAC3D__genmod
          INTERFACE 
            SUBROUTINE TJAC3D(SS,XL,NDM,NEL,SHP,DETJ)
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: SS(3)
              REAL(KIND=8) :: XL(NDM,*)
              INTEGER(KIND=4) :: NEL
              REAL(KIND=8) :: SHP(3,11)
              REAL(KIND=8) :: DETJ
            END SUBROUTINE TJAC3D
          END INTERFACE 
        END MODULE TJAC3D__genmod
