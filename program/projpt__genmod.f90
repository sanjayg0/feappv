        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:22 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PROJPT__genmod
          INTERFACE 
            FUNCTION PROJPT(X,XP,XI,GAP,NORMAL,SHP)
              REAL(KIND=8) :: X(3)
              REAL(KIND=8) :: XP(3,9)
              REAL(KIND=8) :: XI(2)
              REAL(KIND=8) :: GAP
              REAL(KIND=8) :: NORMAL(3)
              REAL(KIND=8) :: SHP(9)
              INTEGER(KIND=4) :: PROJPT
            END FUNCTION PROJPT
          END INTERFACE 
        END MODULE PROJPT__genmod
