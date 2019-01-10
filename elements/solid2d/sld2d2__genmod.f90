        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:26 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SLD2D2__genmod
          INTERFACE 
            SUBROUTINE SLD2D2(D,UL,XL,IX,TL,S,P,NDF,NDM,NST,ISW)
              COMMON/CDATA/ NUMNP,NUMEL,NUMMAT,NEN,NEQ,IPR,NETYP
                INTEGER(KIND=4) :: NUMNP
                INTEGER(KIND=4) :: NUMEL
                INTEGER(KIND=4) :: NUMMAT
                INTEGER(KIND=4) :: NEN
                INTEGER(KIND=4) :: NEQ
                INTEGER(KIND=4) :: IPR
                INTEGER(KIND=4) :: NETYP
              INTEGER(KIND=4) :: NST
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NDF
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: UL(NDF,NEN,*)
              REAL(KIND=8) :: XL(NDM,*)
              INTEGER(KIND=4) :: IX(*)
              REAL(KIND=8) :: TL(*)
              REAL(KIND=8) :: S(NST,*)
              REAL(KIND=8) :: P(*)
              INTEGER(KIND=4) :: ISW
            END SUBROUTINE SLD2D2
          END INTERFACE 
        END MODULE SLD2D2__genmod
