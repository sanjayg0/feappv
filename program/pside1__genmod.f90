        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:25 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PSIDE1__genmod
          INTERFACE 
            SUBROUTINE PSIDE1(NR,XS,TR,SIDE,IS,NS,NDM,SHP,RT,X,STYP)
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NR
              REAL(KIND=8) :: XS(3,*)
              REAL(KIND=8) :: TR(3,4)
              INTEGER(KIND=4) :: SIDE
              INTEGER(KIND=4) :: IS(*)
              INTEGER(KIND=4) :: NS
              REAL(KIND=8) :: SHP(*)
              REAL(KIND=8) :: RT(3,*)
              REAL(KIND=8) :: X(NDM,*)
              INTEGER(KIND=4) :: STYP
            END SUBROUTINE PSIDE1
          END INTERFACE 
        END MODULE PSIDE1__genmod
