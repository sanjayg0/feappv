        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:51 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PLTCOR__genmod
          INTERFACE 
            SUBROUTINE PLTCOR(NEL,IC,V,VC,NC)
              INTEGER(KIND=4) :: NC
              INTEGER(KIND=4) :: NEL
              INTEGER(KIND=4) :: IC(NEL)
              REAL(KIND=8) :: V(NEL)
              REAL(KIND=8) :: VC(NC)
            END SUBROUTINE PLTCOR
          END INTERFACE 
        END MODULE PLTCOR__genmod
