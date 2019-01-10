        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:00 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SLCN2D__genmod
          INTERFACE 
            SUBROUTINE SLCN2D(SIG,P,S,SE,NEL,NES)
              COMMON/CDATA/ NUMNP,NUMEL,NUMMAT,NEN,NEQ,IPR,NETYP
                INTEGER(KIND=4) :: NUMNP
                INTEGER(KIND=4) :: NUMEL
                INTEGER(KIND=4) :: NUMMAT
                INTEGER(KIND=4) :: NEN
                INTEGER(KIND=4) :: NEQ
                INTEGER(KIND=4) :: IPR
                INTEGER(KIND=4) :: NETYP
              INTEGER(KIND=4) :: NES
              REAL(KIND=8) :: SIG(NES,*)
              REAL(KIND=8) :: P(*)
              REAL(KIND=8) :: S(NEN,*)
              REAL(KIND=8) :: SE(*)
              INTEGER(KIND=4) :: NEL
            END SUBROUTINE SLCN2D
          END INTERFACE 
        END MODULE SLCN2D__genmod
