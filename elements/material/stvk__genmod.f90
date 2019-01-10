        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:06 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE STVK__genmod
          INTERFACE 
            SUBROUTINE STVK(D,DETF,FA,DF,SIG,DS,ENERGY)
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: DETF
              REAL(KIND=8) :: FA(9)
              REAL(KIND=8) :: DF(9)
              REAL(KIND=8) :: SIG(6)
              REAL(KIND=8) :: DS(6,6)
              REAL(KIND=8) :: ENERGY
            END SUBROUTINE STVK
          END INTERFACE 
        END MODULE STVK__genmod
