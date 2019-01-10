        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:44 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE LCLIP__genmod
          INTERFACE 
            FUNCTION LCLIP(IX,NEN,X,NDM)
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: IX(NEN)
              REAL(KIND=8) :: X(NDM,*)
              LOGICAL(KIND=4) :: LCLIP
            END FUNCTION LCLIP
          END INTERFACE 
        END MODULE LCLIP__genmod
