        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:21 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PRJ2DL__genmod
          INTERFACE 
            SUBROUTINE PRJ2DL(GAP0,TOLG,TOL,X0,IP,XIN,X,XL,NDM,NUMNP,   &
     &POLFL)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: GAP0
              REAL(KIND=8) :: TOLG
              REAL(KIND=8) :: TOL
              REAL(KIND=8) :: X0(2)
              INTEGER(KIND=4) :: IP(NUMNP)
              REAL(KIND=8) :: XIN(*)
              REAL(KIND=8) :: X(NDM,*)
              REAL(KIND=8) :: XL(2,3)
              LOGICAL(KIND=4) :: POLFL
            END SUBROUTINE PRJ2DL
          END INTERFACE 
        END MODULE PRJ2DL__genmod
