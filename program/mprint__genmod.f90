        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:54 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MPRINT__genmod
          INTERFACE 
            SUBROUTINE MPRINT(A,II,JJ,MM,NAMEA)
              INTEGER(KIND=4) :: MM
              REAL(KIND=8) :: A(MM,*)
              INTEGER(KIND=4) :: II
              INTEGER(KIND=4) :: JJ
              CHARACTER(*) :: NAMEA
            END SUBROUTINE MPRINT
          END INTERFACE 
        END MODULE MPRINT__genmod
