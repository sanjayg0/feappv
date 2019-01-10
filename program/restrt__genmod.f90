        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:29 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE RESTRT__genmod
          INTERFACE 
            SUBROUTINE RESTRT(FRESX,U,NDM,NDF,NNEQ,ISW)
              CHARACTER(*) :: FRESX
              REAL(KIND=8) :: U(*)
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NNEQ
              INTEGER(KIND=4) :: ISW
            END SUBROUTINE RESTRT
          END INTERFACE 
        END MODULE RESTRT__genmod
