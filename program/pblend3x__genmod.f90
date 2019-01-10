        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:53 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PBLEND3X__genmod
          INTERFACE 
            SUBROUTINE PBLEND3X(X1,NR1,NS1,X2,NR2,NS2,X3,NR3,NS3,X4,NR4,&
     &NS4,X5,NR5,NS5,X6,NR6,NS6,NTY,X,NDM,IBLEND,NF)
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NS6
              INTEGER(KIND=4) :: NR6
              INTEGER(KIND=4) :: NS5
              INTEGER(KIND=4) :: NR5
              INTEGER(KIND=4) :: NS4
              INTEGER(KIND=4) :: NR4
              INTEGER(KIND=4) :: NS3
              INTEGER(KIND=4) :: NR3
              INTEGER(KIND=4) :: NS2
              INTEGER(KIND=4) :: NR2
              INTEGER(KIND=4) :: NS1
              INTEGER(KIND=4) :: NR1
              REAL(KIND=8) :: X1(3,0:NR1,0:NS1)
              REAL(KIND=8) :: X2(3,0:NR2,0:NS2)
              REAL(KIND=8) :: X3(3,0:NR3,0:NS3)
              REAL(KIND=8) :: X4(3,0:NR4,0:NS4)
              REAL(KIND=8) :: X5(3,0:NR5,0:NS5)
              REAL(KIND=8) :: X6(3,0:NR6,0:NS6)
              INTEGER(KIND=4) :: NTY(*)
              REAL(KIND=8) :: X(NDM,*)
              INTEGER(KIND=4) :: IBLEND(*)
              INTEGER(KIND=4) :: NF
            END SUBROUTINE PBLEND3X
          END INTERFACE 
        END MODULE PBLEND3X__genmod
