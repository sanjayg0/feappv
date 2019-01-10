        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:19 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE RAYS1D__genmod
          INTERFACE 
            SUBROUTINE RAYS1D(D,SHP,SIG,DD,VL,XL,NDF,NDM,NEL)
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NDF
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: SHP(2,*)
              REAL(KIND=8) :: SIG(*)
              REAL(KIND=8) :: DD(6,6)
              REAL(KIND=8) :: VL(NDF,*)
              REAL(KIND=8) :: XL(NDM,*)
              INTEGER(KIND=4) :: NEL
            END SUBROUTINE RAYS1D
          END INTERFACE 
        END MODULE RAYS1D__genmod
