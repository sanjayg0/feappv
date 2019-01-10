        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:24 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE RAYS2D__genmod
          INTERFACE 
            SUBROUTINE RAYS2D(D,SHP,SIG,DD,VL,XL,NDF,NDM,NEL)
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NDF
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: SHP(3,*)
              REAL(KIND=8) :: SIG(*)
              REAL(KIND=8) :: DD(6,6)
              REAL(KIND=8) :: VL(NDF,*)
              REAL(KIND=8) :: XL(NDM,*)
              INTEGER(KIND=4) :: NEL
            END SUBROUTINE RAYS2D
          END INTERFACE 
        END MODULE RAYS2D__genmod
