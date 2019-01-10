        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:55 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PLTSTR__genmod
          INTERFACE 
            SUBROUTINE PLTSTR(DT,SP,ST,NUMNP,NDM)
              INTEGER(KIND=4) :: NUMNP
              REAL(KIND=8) :: DT(NUMNP)
              REAL(KIND=8) :: SP(NUMNP,*)
              REAL(KIND=8) :: ST(NUMNP,*)
              INTEGER(KIND=4) :: NDM
            END SUBROUTINE PLTSTR
          END INTERFACE 
        END MODULE PLTSTR__genmod
