        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:23 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE INTERP2D__genmod
          INTERFACE 
            SUBROUTINE INTERP2D(L,XL,IX,NDM,NEL,FLAG)
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: L
              REAL(KIND=8) :: XL(NDM,*)
              INTEGER(KIND=4) :: IX(*)
              INTEGER(KIND=4) :: NEL
              LOGICAL(KIND=4) :: FLAG
            END SUBROUTINE INTERP2D
          END INTERFACE 
        END MODULE INTERP2D__genmod
