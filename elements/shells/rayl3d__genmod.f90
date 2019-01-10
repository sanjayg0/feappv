        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:14 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE RAYL3D__genmod
          INTERFACE 
            SUBROUTINE RAYL3D(D,VL,NEL,L,NORM,MOMT,DD)
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: VL(6,*)
              INTEGER(KIND=4) :: NEL
              INTEGER(KIND=4) :: L
              REAL(KIND=8) :: NORM(6)
              REAL(KIND=8) :: MOMT(6)
              REAL(KIND=8) :: DD(6,6)
            END SUBROUTINE RAYL3D
          END INTERFACE 
        END MODULE RAYL3D__genmod
