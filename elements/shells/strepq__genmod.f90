        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE STREPQ__genmod
          INTERFACE 
            SUBROUTINE STREPQ(DD,BT_B,BB_B,B_HAT,NS,S_HAT,UL,NDF,EPS,SIG&
     &,SHEAR)
              INTEGER(KIND=4) :: NDF
              REAL(KIND=8) :: DD(3,3)
              REAL(KIND=8) :: BT_B(3,3,4)
              REAL(KIND=8) :: BB_B(3,4)
              REAL(KIND=8) :: B_HAT(4)
              REAL(KIND=8) :: NS(2,4)
              REAL(KIND=8) :: S_HAT(4)
              REAL(KIND=8) :: UL(NDF,4)
              REAL(KIND=8) :: EPS(3)
              REAL(KIND=8) :: SIG(6)
              REAL(KIND=8) :: SHEAR(2)
            END SUBROUTINE STREPQ
          END INTERFACE 
        END MODULE STREPQ__genmod
