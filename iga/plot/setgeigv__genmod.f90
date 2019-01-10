        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SETGEIGV__genmod
          INTERFACE 
            SUBROUTINE SETGEIGV(EV,EV_LIN,MQ,NDF,ND_LIN,ND)
              INTEGER(KIND=4) :: ND_LIN
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: MQ
              REAL(KIND=8) :: EV(NDF,MQ)
              REAL(KIND=8) :: EV_LIN(NDF,ND_LIN,MQ)
              INTEGER(KIND=4) :: ND
            END SUBROUTINE SETGEIGV
          END INTERFACE 
        END MODULE SETGEIGV__genmod
