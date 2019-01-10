        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:37 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE TIEFOR__genmod
          INTERFACE 
            SUBROUTINE TIEFOR(ID,F,IP,NDF,NUMNP)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: ID(NDF,*)
              REAL(KIND=8) :: F(NDF,*)
              INTEGER(KIND=4) :: IP(NUMNP)
            END SUBROUTINE TIEFOR
          END INTERFACE 
        END MODULE TIEFOR__genmod
