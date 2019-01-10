        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:29 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE RSTPRF__genmod
          INTERFACE 
            SUBROUTINE RSTPRF(JP,IDL,ID,IX,NDF,NEN1,NEN,NEQ,NUMEL)
              INTEGER(KIND=4) :: NEN1
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: JP(*)
              INTEGER(KIND=4) :: IDL(*)
              INTEGER(KIND=4) :: ID(NDF,*)
              INTEGER(KIND=4) :: IX(NEN1,*)
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: NEQ
              INTEGER(KIND=4) :: NUMEL
            END SUBROUTINE RSTPRF
          END INTERFACE 
        END MODULE RSTPRF__genmod
