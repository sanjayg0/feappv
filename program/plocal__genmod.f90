        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:12 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PLOCAL__genmod
          INTERFACE 
            SUBROUTINE PLOCAL(LD,EQ,ID,IX,IEDOF,XL,UL,TL,UB,X,F,U,UD,T, &
     &UN,DUN,NROT,DFL,JSW)
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
              INTEGER(KIND=4) :: LD(NST)
              INTEGER(KIND=4) :: EQ(NDF,*)
              INTEGER(KIND=4) :: ID(NDF,*)
              INTEGER(KIND=4) :: IX(*)
              INTEGER(KIND=4) :: IEDOF(NDF,*)
              REAL(KIND=8) :: XL(NDM,*)
              REAL(KIND=8) :: UL(NDF,NEN,*)
              REAL(KIND=8) :: TL(*)
              REAL(KIND=8) :: UB(*)
              REAL(KIND=8) :: X(NDM,*)
              REAL(KIND=8) :: F(NDF,*)
              REAL(KIND=8) :: U(NDF,*)
              REAL(KIND=8) :: UD(*)
              REAL(KIND=8) :: T(*)
              REAL(KIND=8) :: UN(*)
              REAL(KIND=8) :: DUN(*)
              INTEGER(KIND=4) :: NROT
              LOGICAL(KIND=4) :: DFL
              INTEGER(KIND=4) :: JSW
            END SUBROUTINE PLOCAL
          END INTERFACE 
        END MODULE PLOCAL__genmod
