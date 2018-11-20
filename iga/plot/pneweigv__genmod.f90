        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:13 2018
        MODULE PNEWEIGV__genmod
          INTERFACE 
            SUBROUTINE PNEWEIGV(ID,EVEC,EVEX,MQ,NEQ,NDF,NUMNP)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NEQ
              INTEGER(KIND=4) :: ID(NDF,*)
              REAL(KIND=8) :: EVEC(NEQ,*)
              REAL(KIND=8) :: EVEX(NDF,NUMNP,*)
              INTEGER(KIND=4) :: MQ
            END SUBROUTINE PNEWEIGV
          END INTERFACE 
        END MODULE PNEWEIGV__genmod
