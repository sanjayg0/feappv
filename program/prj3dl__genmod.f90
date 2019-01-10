        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:22 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PRJ3DL__genmod
          INTERFACE 
            SUBROUTINE PRJ3DL(PL,IX,X,X0,ID,IE,F,IBN,ANG,GAP0,NEN,NEN1, &
     &NDM,NDF,NUMNP,NUMEL,PRT,PRTH,FNORM,POLFL,DDOF,ISW)
              COMMON/CDAT1/ NDD,NIE,NUD
                INTEGER(KIND=4) :: NDD
                INTEGER(KIND=4) :: NIE
                INTEGER(KIND=4) :: NUD
              INTEGER(KIND=4) :: NUMEL
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NEN1
              REAL(KIND=8) :: PL(*)
              INTEGER(KIND=4) :: IX(NEN1,NUMEL)
              REAL(KIND=8) :: X(NDM,NUMNP)
              REAL(KIND=8) :: X0(NDM)
              INTEGER(KIND=4) :: ID(NDF,NUMNP)
              INTEGER(KIND=4) :: IE(NIE,*)
              REAL(KIND=8) :: F(NDF,NUMNP,*)
              INTEGER(KIND=4) :: IBN(NUMNP)
              REAL(KIND=8) :: ANG(*)
              REAL(KIND=8) :: GAP0
              INTEGER(KIND=4) :: NEN
              LOGICAL(KIND=4) :: PRT
              LOGICAL(KIND=4) :: PRTH
              INTEGER(KIND=4) :: FNORM
              LOGICAL(KIND=4) :: POLFL
              INTEGER(KIND=4) :: DDOF
              INTEGER(KIND=4) :: ISW
            END SUBROUTINE PRJ3DL
          END INTERFACE 
        END MODULE PRJ3DL__genmod
