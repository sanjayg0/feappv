        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:16 2018
        MODULE PBLKDI2D__genmod
          INTERFACE 
            SUBROUTINE PBLKDI2D(PKO,PSIDES,NDISP,BCSET,X,WT,XL,WL,ID,F, &
     &FL,AV,LKNOT,KNOTS)
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
              COMMON/IGDATA/ DKNOTIG,LKNOTIG,NKNOTIG,DSIDEIG,NSIDEIG,   &
     &DBLOKIG,NBLOKIG,NSTRPIG
                INTEGER(KIND=4) :: DKNOTIG
                INTEGER(KIND=4) :: LKNOTIG
                INTEGER(KIND=4) :: NKNOTIG
                INTEGER(KIND=4) :: DSIDEIG
                INTEGER(KIND=4) :: NSIDEIG
                INTEGER(KIND=4) :: DBLOKIG
                INTEGER(KIND=4) :: NBLOKIG
                INTEGER(KIND=4) :: NSTRPIG
              INTEGER(KIND=4) :: PKO(2)
              INTEGER(KIND=4) :: PSIDES(300)
              REAL(KIND=8) :: NDISP(*)
              INTEGER(KIND=4) :: BCSET
              REAL(KIND=8) :: X(NDM,*)
              REAL(KIND=8) :: WT(*)
              REAL(KIND=8) :: XL(NDM,*)
              REAL(KIND=8) :: WL(*)
              INTEGER(KIND=4) :: ID(NDF,*)
              REAL(KIND=8) :: F(NDF,*)
              REAL(KIND=8) :: FL(NDF,*)
              REAL(KIND=8) :: AV(*)
              INTEGER(KIND=4) :: LKNOT(0:4,*)
              REAL(KIND=8) :: KNOTS(DKNOTIG,*)
            END SUBROUTINE PBLKDI2D
          END INTERFACE 
        END MODULE PBLKDI2D__genmod
