        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:58 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PBLEND1B__genmod
          INTERFACE 
            SUBROUTINE PBLEND1B(XS,IS,TRB,IBLEND,ILR,X,IX,ISIDE,ISD,NDM,&
     &NEN1,PRT,PRTH,EFLAG,NFLAG)
              INTEGER(KIND=4) :: NEN1
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: ISD
              REAL(KIND=8) :: XS(3,*)
              INTEGER(KIND=4) :: IS(ISD,*)
              REAL(KIND=8) :: TRB(3,4)
              INTEGER(KIND=4) :: IBLEND(*)
              INTEGER(KIND=4) :: ILR(*)
              REAL(KIND=8) :: X(NDM,*)
              INTEGER(KIND=4) :: IX(NEN1,*)
              INTEGER(KIND=4) :: ISIDE
              LOGICAL(KIND=4) :: PRT
              LOGICAL(KIND=4) :: PRTH
              LOGICAL(KIND=4) :: EFLAG
              LOGICAL(KIND=4) :: NFLAG
            END SUBROUTINE PBLEND1B
          END INTERFACE 
        END MODULE PBLEND1B__genmod
