        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:27 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE STRN2M__genmod
          INTERFACE 
            SUBROUTINE STRN2M(D,XR1,SHP,XL,UL,TL,STYPE,XR0,XZ0,NDM,NDF, &
     &NEL,NEN,TA,EP)
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: XR1
              REAL(KIND=8) :: SHP(3,*)
              REAL(KIND=8) :: XL(NDM,*)
              REAL(KIND=8) :: UL(NDF,NEN)
              REAL(KIND=8) :: TL(*)
              REAL(KIND=8) :: STYPE
              REAL(KIND=8) :: XR0
              REAL(KIND=8) :: XZ0
              INTEGER(KIND=4) :: NEL
              REAL(KIND=8) :: TA
              REAL(KIND=8) :: EP(4)
            END SUBROUTINE STRN2M
          END INTERFACE 
        END MODULE STRN2M__genmod
