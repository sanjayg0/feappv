        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE STCNPT__genmod
          INTERFACE 
            SUBROUTINE STCNPT(IX,DV,EL,LINT,SIG,EPS,SHEAR,GAMM,DT,ST,SER&
     &,ERRAV,NUMNP)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: IX(*)
              REAL(KIND=8) :: DV(*)
              REAL(KIND=8) :: EL(3,*)
              INTEGER(KIND=4) :: LINT
              REAL(KIND=8) :: SIG(3,*)
              REAL(KIND=8) :: EPS(3,*)
              REAL(KIND=8) :: SHEAR(2)
              REAL(KIND=8) :: GAMM(2)
              REAL(KIND=8) :: DT(NUMNP)
              REAL(KIND=8) :: ST(NUMNP,*)
              REAL(KIND=8) :: SER(*)
              REAL(KIND=8) :: ERRAV
            END SUBROUTINE STCNPT
          END INTERFACE 
        END MODULE STCNPT__genmod
