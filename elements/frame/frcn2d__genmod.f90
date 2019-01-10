        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:00 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FRCN2D__genmod
          INTERFACE 
            SUBROUTINE FRCN2D(IX,P,NDF,DT,ST,NUMNP)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: IX(*)
              REAL(KIND=8) :: P(NDF,*)
              REAL(KIND=8) :: DT(NUMNP)
              REAL(KIND=8) :: ST(NUMNP,*)
            END SUBROUTINE FRCN2D
          END INTERFACE 
        END MODULE FRCN2D__genmod
