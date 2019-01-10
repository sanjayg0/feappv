        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:23 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GVEC2D__genmod
          INTERFACE 
            SUBROUTINE GVEC2D(XL,UL,C,NDM,NDF)
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: XL(NDM,*)
              REAL(KIND=8) :: UL(NDF,*)
              REAL(KIND=8) :: C
            END SUBROUTINE GVEC2D
          END INTERFACE 
        END MODULE GVEC2D__genmod
