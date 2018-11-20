        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:21 2018
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
