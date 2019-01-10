        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:37 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE TBLK__genmod
          INTERFACE 
            SUBROUTINE TBLK(NR,NS,NT,TL,T,IXL,DR,DS,DT,NI,NDM,NODINC,NM,&
     &PRT,PRTH)
              INTEGER(KIND=4) :: NR
              INTEGER(KIND=4) :: NS
              INTEGER(KIND=4) :: NT
              REAL(KIND=8) :: TL(*)
              REAL(KIND=8) :: T(*)
              INTEGER(KIND=4) :: IXL(9)
              REAL(KIND=8) :: DR
              REAL(KIND=8) :: DS
              REAL(KIND=8) :: DT
              INTEGER(KIND=4) :: NI
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NODINC
              INTEGER(KIND=4) :: NM
              LOGICAL(KIND=4) :: PRT
              LOGICAL(KIND=4) :: PRTH
            END SUBROUTINE TBLK
          END INTERFACE 
        END MODULE TBLK__genmod
