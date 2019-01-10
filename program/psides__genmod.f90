        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:26 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PSIDES__genmod
          INTERFACE 
            SUBROUTINE PSIDES(IS,SIDE,NSIDE,PRT,PRTH,ISW)
              INTEGER(KIND=4) :: NSIDE
              INTEGER(KIND=4) :: IS(NSIDE,*)
              INTEGER(KIND=4) :: SIDE
              LOGICAL(KIND=4) :: PRT
              LOGICAL(KIND=4) :: PRTH
              INTEGER(KIND=4) :: ISW
            END SUBROUTINE PSIDES
          END INTERFACE 
        END MODULE PSIDES__genmod
