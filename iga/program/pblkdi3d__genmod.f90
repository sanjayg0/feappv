        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:13 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PBLKDI3D__genmod
          INTERFACE 
            SUBROUTINE PBLKDI3D(PKO,PSIDES,NDISP,X,WT,XL,WL,ID,F,FL)
              COMMON/SDATA/ NDF,NDM,NEN1,NST,NNEQ
                INTEGER(KIND=4) :: NDF
                INTEGER(KIND=4) :: NDM
                INTEGER(KIND=4) :: NEN1
                INTEGER(KIND=4) :: NST
                INTEGER(KIND=4) :: NNEQ
              INTEGER(KIND=4) :: PKO(2)
              INTEGER(KIND=4) :: PSIDES(300,300)
              REAL(KIND=8) :: NDISP(8)
              REAL(KIND=8) :: X(NDM,*)
              REAL(KIND=8) :: WT(*)
              REAL(KIND=8) :: XL(NDM,*)
              REAL(KIND=8) :: WL(*)
              INTEGER(KIND=4) :: ID(NDF,*)
              REAL(KIND=8) :: F(NDF,*)
              REAL(KIND=8) :: FL(NDF,*)
            END SUBROUTINE PBLKDI3D
          END INTERFACE 
        END MODULE PBLKDI3D__genmod
