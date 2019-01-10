        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:32 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE THFX3D__genmod
          INTERFACE 
            SUBROUTINE THFX3D(XL,UL,XX,SHP,TEMP,GRADT,NDM,NDF,NEL)
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: XL(NDM,*)
              REAL(KIND=8) :: UL(NDF,*)
              REAL(KIND=8) :: XX(3)
              REAL(KIND=8) :: SHP(4,*)
              REAL(KIND=8) :: TEMP
              REAL(KIND=8) :: GRADT(3)
              INTEGER(KIND=4) :: NEL
            END SUBROUTINE THFX3D
          END INTERFACE 
        END MODULE THFX3D__genmod
