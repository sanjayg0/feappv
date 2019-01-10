        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:02 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE DERBEZIER1D__genmod
          INTERFACE 
            SUBROUTINE DERBEZIER1D(SG,C_E,P,IS,NSHP)
              INTEGER(KIND=4) :: P
              REAL(KIND=8) :: SG
              REAL(KIND=8) :: C_E(P+1,P+1,*)
              INTEGER(KIND=4) :: IS
              REAL(KIND=8) :: NSHP(4,*)
            END SUBROUTINE DERBEZIER1D
          END INTERFACE 
        END MODULE DERBEZIER1D__genmod
