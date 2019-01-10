        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:32 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE THFX2D__genmod
          INTERFACE 
            SUBROUTINE THFX2D(XL,UL,XX,SHP,TEMP,GRADT,NDM,NDF,NEL)
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: XL(NDM,*)
              REAL(KIND=8) :: UL(NDF,*)
              REAL(KIND=8) :: XX(2)
              REAL(KIND=8) :: SHP(3,*)
              REAL(KIND=8) :: TEMP
              REAL(KIND=8) :: GRADT(3)
              INTEGER(KIND=4) :: NEL
            END SUBROUTINE THFX2D
          END INTERFACE 
        END MODULE THFX2D__genmod
