        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:36 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SUBSP__genmod
          INTERFACE 
            SUBROUTINE SUBSP(A,B,V,T,G,H,D,DP,DTOL,P,NF,NV,NEQ,IMAS,    &
     &SHIFT,TOL,PRT,ITS)
              INTEGER(KIND=4) :: NEQ
              INTEGER(KIND=4) :: NV
              REAL(KIND=8) :: A(*)
              REAL(KIND=8) :: B(*)
              REAL(KIND=8) :: V(NEQ,*)
              REAL(KIND=8) :: T(NEQ)
              REAL(KIND=8) :: G(*)
              REAL(KIND=8) :: H(*)
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: DP(*)
              REAL(KIND=8) :: DTOL(*)
              REAL(KIND=8) :: P(NV,*)
              INTEGER(KIND=4) :: NF
              INTEGER(KIND=4) :: IMAS
              REAL(KIND=8) :: SHIFT
              REAL(KIND=8) :: TOL
              LOGICAL(KIND=4) :: PRT
              INTEGER(KIND=4) :: ITS
            END SUBROUTINE SUBSP
          END INTERFACE 
        END MODULE SUBSP__genmod
