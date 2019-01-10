        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:21 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE BBAR2M__genmod
          INTERFACE 
            SUBROUTINE BBAR2M(SG,SHP,DVOL,XJI,LINT,NEL,HH,THETA,SHPBAR)
              REAL(KIND=8) :: SG(3,*)
              REAL(KIND=8) :: SHP(3,64,*)
              REAL(KIND=8) :: DVOL(*)
              REAL(KIND=8) :: XJI(2,*)
              INTEGER(KIND=4) :: LINT
              INTEGER(KIND=4) :: NEL
              REAL(KIND=8) :: HH(3,3)
              REAL(KIND=8) :: THETA(2,*)
              REAL(KIND=8) :: SHPBAR(2,9,*)
            END SUBROUTINE BBAR2M
          END INTERFACE 
        END MODULE BBAR2M__genmod
