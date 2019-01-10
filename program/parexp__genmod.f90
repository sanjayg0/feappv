        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:57 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PAREXP__genmod
          INTERFACE 
            SUBROUTINE PAREXP(X,XS,V,NEX,ERROR)
              CHARACTER(*) :: X
              CHARACTER(*) :: XS
              REAL(KIND=8) :: V(*)
              INTEGER(KIND=4) :: NEX
              LOGICAL(KIND=4) :: ERROR
            END SUBROUTINE PAREXP
          END INTERFACE 
        END MODULE PAREXP__genmod
