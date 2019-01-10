        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:30 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SBLKN__genmod
          INTERFACE 
            SUBROUTINE SBLKN(NR,NS,XL,IXL,SHP,X,DR,DS,NI,N,NDM,NODINC,  &
     &NTYP,NM,CTYPE,PRT,PRTH)
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NR
              INTEGER(KIND=4) :: NS
              REAL(KIND=8) :: XL(3,*)
              INTEGER(KIND=4) :: IXL(*)
              REAL(KIND=8) :: SHP(3,*)
              REAL(KIND=8) :: X(NDM,*)
              REAL(KIND=8) :: DR
              REAL(KIND=8) :: DS
              INTEGER(KIND=4) :: NI
              INTEGER(KIND=4) :: N
              INTEGER(KIND=4) :: NODINC
              INTEGER(KIND=4) :: NTYP
              INTEGER(KIND=4) :: NM
              CHARACTER(LEN=15) :: CTYPE
              LOGICAL(KIND=4) :: PRT
              LOGICAL(KIND=4) :: PRTH
            END SUBROUTINE SBLKN
          END INTERFACE 
        END MODULE SBLKN__genmod
