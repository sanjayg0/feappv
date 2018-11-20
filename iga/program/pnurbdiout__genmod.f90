        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:16 2018
        MODULE PNURBDIOUT__genmod
          INTERFACE 
            SUBROUTINE PNURBDIOUT(ITYPE,NDISP,X,U)
              COMMON/CDATA/ NUMNP,NUMEL,NUMMAT,NEN,NEQ,IPR,NETYP
                INTEGER(KIND=4) :: NUMNP
                INTEGER(KIND=4) :: NUMEL
                INTEGER(KIND=4) :: NUMMAT
                INTEGER(KIND=4) :: NEN
                INTEGER(KIND=4) :: NEQ
                INTEGER(KIND=4) :: IPR
                INTEGER(KIND=4) :: NETYP
              COMMON/SDATA/ NDF,NDM,NEN1,NST,NNEQ
                INTEGER(KIND=4) :: NDF
                INTEGER(KIND=4) :: NDM
                INTEGER(KIND=4) :: NEN1
                INTEGER(KIND=4) :: NST
                INTEGER(KIND=4) :: NNEQ
              INTEGER(KIND=4) :: ITYPE
              REAL(KIND=8) :: NDISP(8)
              REAL(KIND=8) :: X(NDM,NUMNP)
              REAL(KIND=8) :: U(NDF,NUMNP)
            END SUBROUTINE PNURBDIOUT
          END INTERFACE 
        END MODULE PNURBDIOUT__genmod
