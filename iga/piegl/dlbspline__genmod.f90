        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:08 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE DLBSPLINE__genmod
          INTERFACE 
            SUBROUTINE DLBSPLINE(P,U,UU,DERS)
              INTEGER(KIND=4) :: P
              REAL(KIND=8) :: U(0:*)
              REAL(KIND=8) :: UU
              REAL(KIND=8) :: DERS(0:1)
            END SUBROUTINE DLBSPLINE
          END INTERFACE 
        END MODULE DLBSPLINE__genmod
