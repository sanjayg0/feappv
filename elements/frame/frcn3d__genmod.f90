        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:02 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FRCN3D__genmod
          INTERFACE 
            SUBROUTINE FRCN3D(IX,FI,DT,ST,NUMNP)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: IX(*)
              REAL(KIND=8) :: FI(6,*)
              REAL(KIND=8) :: DT(NUMNP)
              REAL(KIND=8) :: ST(NUMNP,*)
            END SUBROUTINE FRCN3D
          END INTERFACE 
        END MODULE FRCN3D__genmod
