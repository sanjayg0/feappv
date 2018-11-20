        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:18 2018
        MODULE PNBLEND__genmod
          INTERFACE 
            SUBROUTINE PNBLEND(TRB,IBLEND,ILR,NUMBL,NUMB,NDM,PRT,PRTH)
              COMMON/CBLEND/ NUMSN,NUMSD,NUMFC,NUMBD,MXILR
                INTEGER(KIND=4) :: NUMSN
                INTEGER(KIND=4) :: NUMSD
                INTEGER(KIND=4) :: NUMFC
                INTEGER(KIND=4) :: NUMBD
                INTEGER(KIND=4) :: MXILR
              INTEGER(KIND=4) :: NUMB
              REAL(KIND=8) :: TRB(3,4,*)
              INTEGER(KIND=4) :: IBLEND(NUMB,*)
              INTEGER(KIND=4) :: ILR(MXILR,*)
              INTEGER(KIND=4) :: NUMBL
              INTEGER(KIND=4) :: NDM
              LOGICAL(KIND=4) :: PRT
              LOGICAL(KIND=4) :: PRTH
            END SUBROUTINE PNBLEND
          END INTERFACE 
        END MODULE PNBLEND__genmod
