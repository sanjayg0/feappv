        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:28 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PTRANS__genmod
          INTERFACE 
            SUBROUTINE PTRANS(IA,ANGL,UL,P,S,NEL,NDF,NST,ISW)
              INTEGER(KIND=4) :: NST
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: IA(2)
              REAL(KIND=8) :: ANGL(*)
              REAL(KIND=8) :: UL(NST,4)
              REAL(KIND=8) :: P(NDF,*)
              REAL(KIND=8) :: S(NST,NST)
              INTEGER(KIND=4) :: NEL
              INTEGER(KIND=4) :: ISW
            END SUBROUTINE PTRANS
          END INTERFACE 
        END MODULE PTRANS__genmod
