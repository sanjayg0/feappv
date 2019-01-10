        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:14 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE TRAN3D__genmod
          INTERFACE 
            SUBROUTINE TRAN3D(XL,YL,T,NDM)
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: XL(NDM,*)
              REAL(KIND=8) :: YL(3,4)
              REAL(KIND=8) :: T(3,3)
            END SUBROUTINE TRAN3D
          END INTERFACE 
        END MODULE TRAN3D__genmod
