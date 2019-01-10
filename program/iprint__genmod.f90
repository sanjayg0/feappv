        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:52 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE IPRINT__genmod
          INTERFACE 
            SUBROUTINE IPRINT(IA,II,JJ,MM,NAMEA)
              INTEGER(KIND=4) :: MM
              INTEGER(KIND=4) :: IA(MM,*)
              INTEGER(KIND=4) :: II
              INTEGER(KIND=4) :: JJ
              CHARACTER(*) :: NAMEA
            END SUBROUTINE IPRINT
          END INTERFACE 
        END MODULE IPRINT__genmod
