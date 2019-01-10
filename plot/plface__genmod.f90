        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:48 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PLFACE__genmod
          INTERFACE 
            SUBROUTINE PLFACE(IX,IP,X,NDM,NEN1,NUMNP,NUMEL,ILN,CT)
              INTEGER(KIND=4) :: NUMEL
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NEN1
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: IX(NEN1,NUMEL)
              INTEGER(KIND=4) :: IP(NUMEL)
              REAL(KIND=8) :: X(NDM,NUMNP)
              INTEGER(KIND=4) :: ILN(2)
              REAL(KIND=8) :: CT
            END SUBROUTINE PLFACE
          END INTERFACE 
        END MODULE PLFACE__genmod
