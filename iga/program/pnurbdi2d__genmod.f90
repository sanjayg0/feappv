        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:18 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
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
