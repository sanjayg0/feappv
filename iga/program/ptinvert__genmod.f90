        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:19 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PTINVERT__genmod
          INTERFACE 
            SUBROUTINE PTINVERT(XP,XL,WT,KNOT,ORD,LEN,NDM,U)
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: XP(*)
              REAL(KIND=8) :: XL(NDM,*)
              REAL(KIND=8) :: WT(*)
              REAL(KIND=8) :: KNOT(*)
              INTEGER(KIND=4) :: ORD
              INTEGER(KIND=4) :: LEN
              REAL(KIND=8) :: U
            END SUBROUTINE PTINVERT
          END INTERFACE 
        END MODULE PTINVERT__genmod
