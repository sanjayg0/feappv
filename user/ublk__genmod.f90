        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:23:09 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE UBLK__genmod
          INTERFACE 
            SUBROUTINE UBLK(NTYP,NN,NR,NS,NT,XL,X,IXL,IX,DR,DS,DT,NI,NE,&
     &NDM,NEN1,MA,CTYPE,PRT,ISW)
              INTEGER(KIND=4) :: NTYP
              INTEGER(KIND=4) :: NN
              INTEGER(KIND=4) :: NR
              INTEGER(KIND=4) :: NS
              INTEGER(KIND=4) :: NT
              REAL(KIND=8) :: XL(*)
              REAL(KIND=8) :: X(*)
              INTEGER(KIND=4) :: IXL(*)
              INTEGER(KIND=4) :: IX(*)
              REAL(KIND=8) :: DR
              REAL(KIND=8) :: DS
              REAL(KIND=8) :: DT
              INTEGER(KIND=4) :: NI
              INTEGER(KIND=4) :: NE
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NEN1
              INTEGER(KIND=4) :: MA
              CHARACTER(LEN=15) :: CTYPE
              LOGICAL(KIND=4) :: PRT
              INTEGER(KIND=4) :: ISW
            END SUBROUTINE UBLK
          END INTERFACE 
        END MODULE UBLK__genmod
