        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:37 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE TIENOD__genmod
          INTERFACE 
            SUBROUTINE TIENOD(IX,X,IP,IR,IBUCK,IB,NDM,NEN,NEN1,NUMNP,   &
     &NUMEL,N1,N2,R1,R2,NT,TD)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NEN1
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: IX(NEN1,*)
              REAL(KIND=8) :: X(NDM,NUMNP)
              INTEGER(KIND=4) :: IP(NUMNP)
              INTEGER(KIND=4) :: IR(NUMNP)
              INTEGER(KIND=4) :: IBUCK(NUMNP)
              INTEGER(KIND=4) :: IB(NUMNP)
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: NUMEL
              INTEGER(KIND=4) :: N1
              INTEGER(KIND=4) :: N2
              INTEGER(KIND=4) :: R1
              INTEGER(KIND=4) :: R2
              INTEGER(KIND=4) :: NT
              REAL(KIND=8) :: TD(*)
            END SUBROUTINE TIENOD
          END INTERFACE 
        END MODULE TIENOD__genmod
