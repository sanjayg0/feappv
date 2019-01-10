        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE DMATPL__genmod
          INTERFACE 
            SUBROUTINE DMATPL(D,PSI,DMG,DSG,ALPHG)
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: PSI
              REAL(KIND=8) :: DMG(3,3)
              REAL(KIND=8) :: DSG(2,2)
              REAL(KIND=8) :: ALPHG(3)
            END SUBROUTINE DMATPL
          END INTERFACE 
        END MODULE DMATPL__genmod
