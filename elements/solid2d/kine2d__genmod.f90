        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:23 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE KINE2D__genmod
          INTERFACE 
            SUBROUTINE KINE2D(SHPS,XL,UL,F,DF,DETF,NDM,NDF,NEL,NEN)
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: SHPS(3,*)
              REAL(KIND=8) :: XL(NDM,*)
              REAL(KIND=8) :: UL(NDF,NEN,*)
              REAL(KIND=8) :: F(3,3,*)
              REAL(KIND=8) :: DF(3,3)
              REAL(KIND=8) :: DETF(*)
              INTEGER(KIND=4) :: NEL
            END SUBROUTINE KINE2D
          END INTERFACE 
        END MODULE KINE2D__genmod
