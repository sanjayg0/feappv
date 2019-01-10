        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:53 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PSREGN__genmod
          INTERFACE 
            SUBROUTINE PSREGN(IX,NEN,NEN1,NE,NF,NREG,PRT,PRTH)
              INTEGER(KIND=4) :: NEN1
              INTEGER(KIND=4) :: IX(NEN1,*)
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: NE
              INTEGER(KIND=4) :: NF
              INTEGER(KIND=4) :: NREG
              LOGICAL(KIND=4) :: PRT
              LOGICAL(KIND=4) :: PRTH
            END SUBROUTINE PSREGN
          END INTERFACE 
        END MODULE PSREGN__genmod
