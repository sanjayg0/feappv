        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:41 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE DASOL__genmod
          INTERFACE 
            SUBROUTINE DASOL(AL,AU,AD,B,JP,NEQS,NEQT,ENERGY)
              REAL(KIND=8) :: AL(*)
              REAL(KIND=8) :: AU(*)
              REAL(KIND=8) :: AD(*)
              REAL(KIND=8) :: B(*)
              INTEGER(KIND=4) :: JP(*)
              INTEGER(KIND=4) :: NEQS
              INTEGER(KIND=4) :: NEQT
              REAL(KIND=8) :: ENERGY
            END SUBROUTINE DASOL
          END INTERFACE 
        END MODULE DASOL__genmod
