        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:21 2018
        MODULE PNURBDI2D__genmod
          INTERFACE 
            SUBROUTINE PNURBDI2D(SHP,XX,JAC,NDISP,NEL,NDF,FL)
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NEL
              REAL(KIND=8) :: SHP(4,NEL)
              REAL(KIND=8) :: XX(2)
              REAL(KIND=8) :: JAC
              REAL(KIND=8) :: NDISP(9)
              REAL(KIND=8) :: FL(NDF,NEL)
            END SUBROUTINE PNURBDI2D
          END INTERFACE 
        END MODULE PNURBDI2D__genmod
