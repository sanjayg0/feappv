        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:42 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE DICONT__genmod
          INTERFACE 
            SUBROUTINE DICONT(ID,NUMNP,NDF,LFLAG)
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: ID(NDF,*)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: LFLAG
            END SUBROUTINE DICONT
          END INTERFACE 
        END MODULE DICONT__genmod
