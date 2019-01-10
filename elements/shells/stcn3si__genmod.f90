        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:14 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE STCN3SI__genmod
          INTERFACE 
            SUBROUTINE STCN3SI(IX,D,YL,UL,TR,DT,ST,DVL,THK,NDF,NEL,NUMNP&
     &,ISW)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: IX(*)
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: YL(3,*)
              REAL(KIND=8) :: UL(NDF,*)
              REAL(KIND=8) :: TR(3,3)
              REAL(KIND=8) :: DT(NUMNP)
              REAL(KIND=8) :: ST(NUMNP,*)
              REAL(KIND=8) :: DVL(4)
              REAL(KIND=8) :: THK
              INTEGER(KIND=4) :: NEL
              INTEGER(KIND=4) :: ISW
            END SUBROUTINE STCN3SI
          END INTERFACE 
        END MODULE STCN3SI__genmod
