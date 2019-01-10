        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:24 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE KINE2M__genmod
          INTERFACE 
            SUBROUTINE KINE2M(SHP,UL,F,DF,NDF,NEL,NEN,DETF,LINT)
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: NDF
              REAL(KIND=8) :: SHP(3,64,*)
              REAL(KIND=8) :: UL(NDF,NEN,*)
              REAL(KIND=8) :: F(9,2,*)
              REAL(KIND=8) :: DF(9,*)
              INTEGER(KIND=4) :: NEL
              REAL(KIND=8) :: DETF(2,*)
              INTEGER(KIND=4) :: LINT
            END SUBROUTINE KINE2M
          END INTERFACE 
        END MODULE KINE2M__genmod
