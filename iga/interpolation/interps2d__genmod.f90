        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:03 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE INTERPS2D__genmod
          INTERFACE 
            SUBROUTINE INTERPS2D(L,XL,IX,NDM,NLL,FLAG)
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: L
              REAL(KIND=8) :: XL(NDM,*)
              INTEGER(KIND=4) :: IX(*)
              INTEGER(KIND=4) :: NLL
              LOGICAL(KIND=4) :: FLAG
            END SUBROUTINE INTERPS2D
          END INTERFACE 
        END MODULE INTERPS2D__genmod
