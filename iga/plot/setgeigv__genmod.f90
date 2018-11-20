        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:13 2018
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
