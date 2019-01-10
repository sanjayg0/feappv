        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:35 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE BLKGEN__genmod
          INTERFACE 
            SUBROUTINE BLKGEN(NDM,NEN1,X,IX,PRT,PRTH)
              INTEGER(KIND=4) :: NEN1
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: X(NDM,*)
              INTEGER(KIND=4) :: IX(NEN1,*)
              LOGICAL(KIND=4) :: PRT
              LOGICAL(KIND=4) :: PRTH
            END SUBROUTINE BLKGEN
          END INTERFACE 
        END MODULE BLKGEN__genmod
