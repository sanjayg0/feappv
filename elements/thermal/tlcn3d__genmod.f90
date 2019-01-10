        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:33 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE TLCN3D__genmod
          INTERFACE 
            SUBROUTINE TLCN3D(FLUX,P,S,SE,NEL)
              COMMON/CDATA/ NUMNP,NUMEL,NUMMAT,NEN,NEQ,IPR,NETYP
                INTEGER(KIND=4) :: NUMNP
                INTEGER(KIND=4) :: NUMEL
                INTEGER(KIND=4) :: NUMMAT
                INTEGER(KIND=4) :: NEN
                INTEGER(KIND=4) :: NEQ
                INTEGER(KIND=4) :: IPR
                INTEGER(KIND=4) :: NETYP
              REAL(KIND=8) :: FLUX(3,*)
              REAL(KIND=8) :: P(*)
              REAL(KIND=8) :: S(NEN,*)
              REAL(KIND=8) :: SE(*)
              INTEGER(KIND=4) :: NEL
            END SUBROUTINE TLCN3D
          END INTERFACE 
        END MODULE TLCN3D__genmod
