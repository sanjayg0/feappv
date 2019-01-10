        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:48 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GENCLR__genmod
          INTERFACE 
            SUBROUTINE GENCLR(NDF,V,NTY,NUMNP)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NDF
              REAL(KIND=8) :: V(NDF,NUMNP)
              INTEGER(KIND=4) :: NTY(NUMNP)
            END SUBROUTINE GENCLR
          END INTERFACE 
        END MODULE GENCLR__genmod
