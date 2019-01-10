        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:31 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE STRN3D__genmod
          INTERFACE 
            SUBROUTINE STRN3D(D,UL,TH,SHP,NDF,NEL,EPS,TA)
              COMMON/CDATA/ NUMNP,NUMEL,NUMMAT,NEN,NEQ,IPR,NETYP
                INTEGER(KIND=4) :: NUMNP
                INTEGER(KIND=4) :: NUMEL
                INTEGER(KIND=4) :: NUMMAT
                INTEGER(KIND=4) :: NEN
                INTEGER(KIND=4) :: NEQ
                INTEGER(KIND=4) :: IPR
                INTEGER(KIND=4) :: NETYP
              INTEGER(KIND=4) :: NDF
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: UL(NDF,NEN,*)
              REAL(KIND=8) :: TH(*)
              REAL(KIND=8) :: SHP(4,*)
              INTEGER(KIND=4) :: NEL
              REAL(KIND=8) :: EPS(9,*)
              REAL(KIND=8) :: TA
            END SUBROUTINE STRN3D
          END INTERFACE 
        END MODULE STRN3D__genmod
