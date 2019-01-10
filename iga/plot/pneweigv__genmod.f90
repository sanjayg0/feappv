        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
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
