        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:13 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PELLIPSE__genmod
          INTERFACE 
            SUBROUTINE PELLIPSE(XX,NDISP,U,V,PSFLAG)
              REAL(KIND=8) :: XX(2)
              REAL(KIND=8) :: NDISP(3)
              REAL(KIND=8) :: U
              REAL(KIND=8) :: V
              LOGICAL(KIND=4) :: PSFLAG
            END SUBROUTINE PELLIPSE
          END INTERFACE 
        END MODULE PELLIPSE__genmod
