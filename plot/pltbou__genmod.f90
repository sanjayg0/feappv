        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:51 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PLTBOU__genmod
          INTERFACE 
            SUBROUTINE PLTBOU(ID,X,ANGL,IP,NDM,NDF,NUMNP,NBOU)
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: ID(NDF,*)
              REAL(KIND=8) :: X(NDM,*)
              REAL(KIND=8) :: ANGL(*)
              INTEGER(KIND=4) :: IP(*)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NBOU
            END SUBROUTINE PLTBOU
          END INTERFACE 
        END MODULE PLTBOU__genmod
