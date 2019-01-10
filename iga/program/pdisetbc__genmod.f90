        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:13 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PDISETBC__genmod
          INTERFACE 
            SUBROUTINE PDISETBC(IX,NEL,ID,NDF)
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NEL
              INTEGER(KIND=4) :: IX(NEL)
              INTEGER(KIND=4) :: ID(NDF,*)
            END SUBROUTINE PDISETBC
          END INTERFACE 
        END MODULE PDISETBC__genmod
