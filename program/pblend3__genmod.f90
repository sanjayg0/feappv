        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:59 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PBLEND3__genmod
          INTERFACE 
            SUBROUTINE PBLEND3(N,TB,IBLEND,ILR,ISD,NDM,NEN1,PRT,PRTH,   &
     &EFLAG,NFLAG)
              INTEGER(KIND=4) :: N
              REAL(KIND=8) :: TB(3,4)
              INTEGER(KIND=4) :: IBLEND(*)
              INTEGER(KIND=4) :: ILR(*)
              INTEGER(KIND=4) :: ISD
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NEN1
              LOGICAL(KIND=4) :: PRT
              LOGICAL(KIND=4) :: PRTH
              LOGICAL(KIND=4) :: EFLAG
              LOGICAL(KIND=4) :: NFLAG
            END SUBROUTINE PBLEND3
          END INTERFACE 
        END MODULE PBLEND3__genmod
