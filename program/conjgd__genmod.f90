        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:40 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CONJGD__genmod
          INTERFACE 
            SUBROUTINE CONJGD(AD,AC,ADR,X,JC,IR,R,Z,P,B,NEQ,JMAX,TOL,RN,&
     &RN0)
              INTEGER(KIND=4) :: NEQ
              REAL(KIND=8) :: AD(NEQ)
              REAL(KIND=8) :: AC(*)
              REAL(KIND=8) :: ADR(NEQ)
              REAL(KIND=8) :: X(*)
              INTEGER(KIND=4) :: JC(*)
              INTEGER(KIND=4) :: IR(*)
              REAL(KIND=8) :: R(*)
              REAL(KIND=8) :: Z(*)
              REAL(KIND=8) :: P(*)
              REAL(KIND=8) :: B(*)
              INTEGER(KIND=4) :: JMAX
              REAL(KIND=8) :: TOL
              REAL(KIND=8) :: RN
              REAL(KIND=8) :: RN0
            END SUBROUTINE CONJGD
          END INTERFACE 
        END MODULE CONJGD__genmod
