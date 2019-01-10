        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:07 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PFORM__genmod
          INTERFACE 
            SUBROUTINE PFORM(UL,XL,TL,LD,P,S,IE,D,ID,X,IX,F,T,JP,U,UD,B,&
     &A,AL,NDD,NIE,NDF,NDM,NEN1,NST,AFL,BFL,DFL,ISW,NN1,NN2,NN3)
              COMMON/CDATA/ NUMNP,NUMEL,NUMMAT,NEN,NEQ,IPR,NETYP
                INTEGER(KIND=4) :: NUMNP
                INTEGER(KIND=4) :: NUMEL
                INTEGER(KIND=4) :: NUMMAT
                INTEGER(KIND=4) :: NEN
                INTEGER(KIND=4) :: NEQ
                INTEGER(KIND=4) :: IPR
                INTEGER(KIND=4) :: NETYP
              INTEGER(KIND=4) :: NST
              INTEGER(KIND=4) :: NEN1
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NIE
              INTEGER(KIND=4) :: NDD
              REAL(KIND=8) :: UL(NST,*)
              REAL(KIND=8) :: XL(NDM,*)
              REAL(KIND=8) :: TL(*)
              INTEGER(KIND=4) :: LD(*)
              REAL(KIND=8) :: P(NST,*)
              REAL(KIND=8) :: S(NST,*)
              INTEGER(KIND=4) :: IE(NIE,*)
              REAL(KIND=8) :: D(NDD,*)
              INTEGER(KIND=4) :: ID(NDF,*)
              REAL(KIND=8) :: X(NDM,*)
              INTEGER(KIND=4) :: IX(NEN1,*)
              REAL(KIND=8) :: F(NDF,NUMNP)
              REAL(KIND=8) :: T(*)
              INTEGER(KIND=4) :: JP(*)
              REAL(KIND=8) :: U(NDF,*)
              REAL(KIND=8) :: UD(*)
              REAL(KIND=8) :: B(*)
              REAL(KIND=8) :: A(*)
              REAL(KIND=8) :: AL(*)
              LOGICAL(KIND=4) :: AFL
              LOGICAL(KIND=4) :: BFL
              LOGICAL(KIND=4) :: DFL
              INTEGER(KIND=4) :: ISW
              INTEGER(KIND=4) :: NN1
              INTEGER(KIND=4) :: NN2
              INTEGER(KIND=4) :: NN3
            END SUBROUTINE PFORM
          END INTERFACE 
        END MODULE PFORM__genmod
