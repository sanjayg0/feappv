        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:31 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SEPROJ__genmod
          INTERFACE 
            SUBROUTINE SEPROJ(P,S,SE,DT,ST,SER,IX,NEL,NEN,NUMNP)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NEN
              REAL(KIND=8) :: P(NEN)
              REAL(KIND=8) :: S(NEN,*)
              REAL(KIND=8) :: SE(*)
              REAL(KIND=8) :: DT(NUMNP)
              REAL(KIND=8) :: ST(NUMNP,*)
              REAL(KIND=8) :: SER(*)
              INTEGER(KIND=4) :: IX(*)
              INTEGER(KIND=4) :: NEL
            END SUBROUTINE SEPROJ
          END INTERFACE 
        END MODULE SEPROJ__genmod
