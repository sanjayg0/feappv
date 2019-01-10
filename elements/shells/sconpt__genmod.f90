        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SCONPT__genmod
          INTERFACE 
            SUBROUTINE SCONPT(HH,BS,S,NDF,NST,ISW)
              INTEGER(KIND=4) :: NST
              REAL(KIND=8) :: HH(4,4)
              REAL(KIND=8) :: BS(3,2,3)
              REAL(KIND=8) :: S(NST,NST)
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: ISW
            END SUBROUTINE SCONPT
          END INTERFACE 
        END MODULE SCONPT__genmod
