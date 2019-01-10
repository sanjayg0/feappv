        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:47 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GAMMA1__genmod
          INTERFACE 
            FUNCTION GAMMA1(ID,PU,PR,DU,T,S)
              COMMON/SDATA/ NDF,NDM,NEN1,NST,NNEQ
                INTEGER(KIND=4) :: NDF
                INTEGER(KIND=4) :: NDM
                INTEGER(KIND=4) :: NEN1
                INTEGER(KIND=4) :: NST
                INTEGER(KIND=4) :: NNEQ
              INTEGER(KIND=4) :: ID(*)
              INTEGER(KIND=8) :: PU
              INTEGER(KIND=8) :: PR
              REAL(KIND=8) :: DU(*)
              REAL(KIND=8) :: T(NNEQ,*)
              REAL(KIND=8) :: S
              REAL(KIND=8) :: GAMMA1
            END FUNCTION GAMMA1
          END INTERFACE 
        END MODULE GAMMA1__genmod
