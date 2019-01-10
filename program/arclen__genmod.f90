        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:34 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ARCLEN__genmod
          INTERFACE 
            SUBROUTINE ARCLEN(DU,U1,U2,F,AL,AU,AD,JP,ID,NDF,NUMNP,NEQ,  &
     &TIME)
              INTEGER(KIND=4) :: NDF
              REAL(KIND=8) :: DU(*)
              REAL(KIND=8) :: U1(*)
              REAL(KIND=8) :: U2(*)
              REAL(KIND=8) :: F(NDF,*)
              REAL(KIND=8) :: AL(*)
              REAL(KIND=8) :: AU(*)
              REAL(KIND=8) :: AD(*)
              INTEGER(KIND=4) :: JP(*)
              INTEGER(KIND=4) :: ID(NDF,*)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NEQ
              REAL(KIND=8) :: TIME
            END SUBROUTINE ARCLEN
          END INTERFACE 
        END MODULE ARCLEN__genmod
