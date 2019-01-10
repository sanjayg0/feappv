        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:25 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PSETS__genmod
          INTERFACE 
            SUBROUTINE PSETS(IXL,IX,ID,G,XS,NSS,TANGFL)
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
              INTEGER(KIND=4) :: NSS
              INTEGER(KIND=4) :: IXL(NDF,NEN)
              INTEGER(KIND=4) :: IX(NEN1,*)
              INTEGER(KIND=4) :: ID(NDF,NUMNP)
              REAL(KIND=8) :: G(NEQ,NSS,2)
              REAL(KIND=8) :: XS(NDM,*)
              LOGICAL(KIND=4) :: TANGFL
            END SUBROUTINE PSETS
          END INTERFACE 
        END MODULE PSETS__genmod
