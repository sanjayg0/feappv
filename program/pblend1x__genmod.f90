        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:58 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PBLEND1X__genmod
          INTERFACE 
            SUBROUTINE PBLEND1X(NN,NR,NI,NDM,FXIM,NTY,X,NFLAG,PRT,PRTH)
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NR
              INTEGER(KIND=4) :: NN
              INTEGER(KIND=4) :: NI
              REAL(KIND=8) :: FXIM(NDM,0:NR)
              INTEGER(KIND=4) :: NTY(*)
              REAL(KIND=8) :: X(NDM,*)
              LOGICAL(KIND=4) :: NFLAG
              LOGICAL(KIND=4) :: PRT
              LOGICAL(KIND=4) :: PRTH
            END SUBROUTINE PBLEND1X
          END INTERFACE 
        END MODULE PBLEND1X__genmod
