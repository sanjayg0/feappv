        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:55 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PLTRIS__genmod
          INTERFACE 
            SUBROUTINE PLTRIS(IC,NC,N,NS,IUTOT,NDM,NDF,NEN,NEN1,NLABI,  &
     &ICOLOR,IX,X,XL,V,VC,DX1,VL,VU,TVC,CONT,VFLG)
              INTEGER(KIND=4) :: NEN1
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: IC
              INTEGER(KIND=4) :: NC
              INTEGER(KIND=4) :: N
              INTEGER(KIND=4) :: NS
              INTEGER(KIND=4) :: IUTOT
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: NLABI
              INTEGER(KIND=4) :: ICOLOR
              INTEGER(KIND=4) :: IX(NEN1,*)
              REAL(KIND=8) :: X(NDM,*)
              REAL(KIND=8) :: XL(3,29)
              REAL(KIND=8) :: V(29)
              REAL(KIND=8) :: VC(12)
              REAL(KIND=8) :: DX1
              REAL(KIND=8) :: VL
              REAL(KIND=8) :: VU
              LOGICAL(KIND=4) :: TVC(9,9)
              LOGICAL(KIND=4) :: CONT
              LOGICAL(KIND=4) :: VFLG
            END SUBROUTINE PLTRIS
          END INTERFACE 
        END MODULE PLTRIS__genmod
