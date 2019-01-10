        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:40 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE VBLKN__genmod
          INTERFACE 
            SUBROUTINE VBLKN(NR,NS,NT,XL,X,IXL,DR,DS,DT,NI,NDM,CTYPE,PRT&
     &,PRTH)
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NR
              INTEGER(KIND=4) :: NS
              INTEGER(KIND=4) :: NT
              REAL(KIND=8) :: XL(3,*)
              REAL(KIND=8) :: X(NDM,*)
              INTEGER(KIND=4) :: IXL(*)
              REAL(KIND=8) :: DR
              REAL(KIND=8) :: DS
              REAL(KIND=8) :: DT
              INTEGER(KIND=4) :: NI
              CHARACTER(LEN=15) :: CTYPE
              LOGICAL(KIND=4) :: PRT
              LOGICAL(KIND=4) :: PRTH
            END SUBROUTINE VBLKN
          END INTERFACE 
        END MODULE VBLKN__genmod
