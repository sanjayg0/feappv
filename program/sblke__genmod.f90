        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:30 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SBLKE__genmod
          INTERFACE 
            SUBROUTINE SBLKE(NR,NS,X,IX,NI,NE,N,NDM,NEN1,NODINC,NTYP,NM,&
     &MAT,DLAYER,ILR,CTYPE)
              INTEGER(KIND=4) :: NEN1
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NR
              INTEGER(KIND=4) :: NS
              REAL(KIND=8) :: X(NDM,*)
              INTEGER(KIND=4) :: IX(NEN1,*)
              INTEGER(KIND=4) :: NI
              INTEGER(KIND=4) :: NE
              INTEGER(KIND=4) :: N
              INTEGER(KIND=4) :: NODINC
              INTEGER(KIND=4) :: NTYP
              INTEGER(KIND=4) :: NM
              INTEGER(KIND=4) :: MAT
              INTEGER(KIND=4) :: DLAYER
              INTEGER(KIND=4) :: ILR(*)
              CHARACTER(LEN=15) :: CTYPE
            END SUBROUTINE SBLKE
          END INTERFACE 
        END MODULE SBLKE__genmod
