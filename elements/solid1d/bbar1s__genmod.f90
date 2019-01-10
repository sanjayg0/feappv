        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:18 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE BBAR1S__genmod
          INTERFACE 
            SUBROUTINE BBAR1S(PHI,SHP,DVOL,LINT,NEL,NPM,HH,IRAD,JRAD,   &
     &THETA,BBAR)
              REAL(KIND=8) :: PHI(3,10)
              REAL(KIND=8) :: SHP(2,20,*)
              REAL(KIND=8) :: DVOL(*)
              INTEGER(KIND=4) :: LINT
              INTEGER(KIND=4) :: NEL
              INTEGER(KIND=4) :: NPM
              REAL(KIND=8) :: HH(3,3)
              REAL(KIND=8) :: IRAD(*)
              REAL(KIND=8) :: JRAD(*)
              REAL(KIND=8) :: THETA(3,*)
              REAL(KIND=8) :: BBAR(8,*)
            END SUBROUTINE BBAR1S
          END INTERFACE 
        END MODULE BBAR1S__genmod
