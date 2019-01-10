        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GEOMPQ__genmod
          INTERFACE 
            SUBROUTINE GEOMPQ(XL,NDM,CO,SI,JAC0)
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: XL(NDM,*)
              REAL(KIND=8) :: CO(4)
              REAL(KIND=8) :: SI(4)
              REAL(KIND=8) :: JAC0(2,2)
            END SUBROUTINE GEOMPQ
          END INTERFACE 
        END MODULE GEOMPQ__genmod
