        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:30 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SLCN3D__genmod
          INTERFACE 
            SUBROUTINE SLCN3D(SIG,P,S,NEL,NES)
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
              INTEGER(KIND=4) :: NEL
            END SUBROUTINE SLCN3D
          END INTERFACE 
        END MODULE SLCN3D__genmod
