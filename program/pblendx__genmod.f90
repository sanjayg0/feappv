        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:59 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PBLENDX__genmod
          INTERFACE 
            SUBROUTINE PBLENDX(NN,NR,NS,NI,NTYP,NDM,FXIM,FETP,FXIP,FETM,&
     &NTY,X,NFLAG,PRT,PRTH)
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NS
              INTEGER(KIND=4) :: NR
              INTEGER(KIND=4) :: NN
              INTEGER(KIND=4) :: NI
              INTEGER(KIND=4) :: NTYP
              REAL(KIND=8) :: FXIM(NDM,0:NR)
              REAL(KIND=8) :: FETP(NDM,0:NS)
              REAL(KIND=8) :: FXIP(NDM,0:NR)
              REAL(KIND=8) :: FETM(NDM,0:NS)
              INTEGER(KIND=4) :: NTY(*)
              REAL(KIND=8) :: X(NDM,*)
              LOGICAL(KIND=4) :: NFLAG
              LOGICAL(KIND=4) :: PRT
              LOGICAL(KIND=4) :: PRTH
            END SUBROUTINE PBLENDX
          END INTERFACE 
        END MODULE PBLENDX__genmod
