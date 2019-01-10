        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:31 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MODLTD__genmod
          INTERFACE 
            SUBROUTINE MODLTD(D,TA,TGRAD,HN,H1,NH,DD,FLUX,RHOC,ISW)
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: TA
              REAL(KIND=8) :: TGRAD(3)
              REAL(KIND=8) :: HN(*)
              REAL(KIND=8) :: H1(*)
              INTEGER(KIND=4) :: NH
              REAL(KIND=8) :: DD(3,3)
              REAL(KIND=8) :: FLUX(3)
              REAL(KIND=8) :: RHOC
              INTEGER(KIND=4) :: ISW
            END SUBROUTINE MODLTD
          END INTERFACE 
        END MODULE MODLTD__genmod
