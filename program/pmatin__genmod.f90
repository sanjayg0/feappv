        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:17 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PMATIN__genmod
          INTERFACE 
            SUBROUTINE PMATIN(TX,D,UL,XL,TL,S,P,IDL,IE,IEDOF,LIE,PRT,   &
     &PRTH)
              COMMON/SDATA/ NDF,NDM,NEN1,NST,NNEQ
                INTEGER(KIND=4) :: NDF
                INTEGER(KIND=4) :: NDM
                INTEGER(KIND=4) :: NEN1
                INTEGER(KIND=4) :: NST
                INTEGER(KIND=4) :: NNEQ
              COMMON/CDATA/ NUMNP,NUMEL,NUMMAT,NEN,NEQ,IPR,NETYP
                INTEGER(KIND=4) :: NUMNP
                INTEGER(KIND=4) :: NUMEL
                INTEGER(KIND=4) :: NUMMAT
                INTEGER(KIND=4) :: NEN
                INTEGER(KIND=4) :: NEQ
                INTEGER(KIND=4) :: IPR
                INTEGER(KIND=4) :: NETYP
              COMMON/CDAT1/ NDD,NIE,NUD
                INTEGER(KIND=4) :: NDD
                INTEGER(KIND=4) :: NIE
                INTEGER(KIND=4) :: NUD
              CHARACTER(LEN=15) :: TX(2)
              REAL(KIND=8) :: D(NDD,*)
              REAL(KIND=8) :: UL(*)
              REAL(KIND=8) :: XL(*)
              REAL(KIND=8) :: TL(*)
              REAL(KIND=8) :: S(*)
              REAL(KIND=8) :: P(*)
              INTEGER(KIND=4) :: IDL(*)
              INTEGER(KIND=4) :: IE(NIE,*)
              INTEGER(KIND=4) :: IEDOF(NDF,NEN,*)
              INTEGER(KIND=4) :: LIE(NDF,*)
              LOGICAL(KIND=4) :: PRT
              LOGICAL(KIND=4) :: PRTH
            END SUBROUTINE PMATIN
          END INTERFACE 
        END MODULE PMATIN__genmod
