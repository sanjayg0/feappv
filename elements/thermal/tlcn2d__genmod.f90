        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:32 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE TLCN2D__genmod
          INTERFACE 
            SUBROUTINE TLCN2D(FLUX,P,S,NEL)
              COMMON/CDATA/ NUMNP,NUMEL,NUMMAT,NEN,NEQ,IPR,NETYP
                INTEGER(KIND=4) :: NUMNP
                INTEGER(KIND=4) :: NUMEL
                INTEGER(KIND=4) :: NUMMAT
                INTEGER(KIND=4) :: NEN
                INTEGER(KIND=4) :: NEQ
                INTEGER(KIND=4) :: IPR
                INTEGER(KIND=4) :: NETYP
              REAL(KIND=8) :: FLUX(2,*)
              REAL(KIND=8) :: P(*)
              REAL(KIND=8) :: S(NEN,*)
              INTEGER(KIND=4) :: NEL
            END SUBROUTINE TLCN2D
          END INTERFACE 
        END MODULE TLCN2D__genmod
