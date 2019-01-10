        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GEOMPT__genmod
          INTERFACE 
            SUBROUTINE GEOMPT(XL,NDM,CO,SI,B,C,AREA)
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: XL(NDM,*)
              REAL(KIND=8) :: CO(3)
              REAL(KIND=8) :: SI(3)
              REAL(KIND=8) :: B(3)
              REAL(KIND=8) :: C(3)
              REAL(KIND=8) :: AREA
            END SUBROUTINE GEOMPT
          END INTERFACE 
        END MODULE GEOMPT__genmod
