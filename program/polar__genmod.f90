        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:20 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE POLAR__genmod
          INTERFACE 
            SUBROUTINE POLAR(NTY,X,NDM,PRT,PRTH)
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NTY(*)
              REAL(KIND=8) :: X(NDM,*)
              LOGICAL(KIND=4) :: PRT
              LOGICAL(KIND=4) :: PRTH
            END SUBROUTINE POLAR
          END INTERFACE 
        END MODULE POLAR__genmod
