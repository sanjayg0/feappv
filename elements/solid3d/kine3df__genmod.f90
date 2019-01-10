        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:28 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE KINE3DF__genmod
          INTERFACE 
            SUBROUTINE KINE3DF(SHP,UL,F,FI,DF,DETFI,NDF,NEL,NEN)
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: NDF
              REAL(KIND=8) :: SHP(4,*)
              REAL(KIND=8) :: UL(NDF,NEN,*)
              REAL(KIND=8) :: F(3,3,*)
              REAL(KIND=8) :: FI(3,3)
              REAL(KIND=8) :: DF(3,3)
              REAL(KIND=8) :: DETFI(*)
              INTEGER(KIND=4) :: NEL
            END SUBROUTINE KINE3DF
          END INTERFACE 
        END MODULE KINE3DF__genmod
