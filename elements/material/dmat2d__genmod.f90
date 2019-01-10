        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:06 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE DMAT2D__genmod
          INTERFACE 
            SUBROUTINE DMAT2D(D,PSI,DMG,BETAG)
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: PSI
              REAL(KIND=8) :: DMG(6,6)
              REAL(KIND=8) :: BETAG(6)
            END SUBROUTINE DMAT2D
          END INTERFACE 
        END MODULE DMAT2D__genmod
