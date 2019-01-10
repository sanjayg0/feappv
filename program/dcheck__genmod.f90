        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:42 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE DCHECK__genmod
          INTERFACE 
            SUBROUTINE DCHECK(X,VD,NT,ERROR)
              CHARACTER(*) :: X
              REAL(KIND=8) :: VD(*)
              INTEGER(KIND=4) :: NT
              LOGICAL(KIND=4) :: ERROR
            END SUBROUTINE DCHECK
          END INTERFACE 
        END MODULE DCHECK__genmod
