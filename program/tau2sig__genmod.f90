        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:36 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE TAU2SIG__genmod
          INTERFACE 
            SUBROUTINE TAU2SIG(TAU,CTAU,VOLMR,DETF,SIG,DD,NTAU)
              INTEGER(KIND=4) :: NTAU
              REAL(KIND=8) :: TAU(6)
              REAL(KIND=8) :: CTAU(NTAU,NTAU)
              REAL(KIND=8) :: VOLMR
              REAL(KIND=8) :: DETF
              REAL(KIND=8) :: SIG(6)
              REAL(KIND=8) :: DD(NTAU,NTAU)
            END SUBROUTINE TAU2SIG
          END INTERFACE 
        END MODULE TAU2SIG__genmod
