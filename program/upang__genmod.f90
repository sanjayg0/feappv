        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:39 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE UPANG__genmod
          INTERFACE 
            SUBROUTINE UPANG(IA,ANG,UL,NDF,ISW)
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: IA(*)
              REAL(KIND=8) :: ANG
              REAL(KIND=8) :: UL(NDF,*)
              INTEGER(KIND=4) :: ISW
            END SUBROUTINE UPANG
          END INTERFACE 
        END MODULE UPANG__genmod
