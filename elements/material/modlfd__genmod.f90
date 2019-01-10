        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:06 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MODLFD__genmod
          INTERFACE 
            SUBROUTINE MODLFD(II,D,F,DF,DETF,TA,HN,HN1,NH,ISTRT,DD,SIG, &
     &BB,BBAR,ISW)
              INTEGER(KIND=4) :: II
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: F(3,3)
              REAL(KIND=8) :: DF(3,3)
              REAL(KIND=8) :: DETF(*)
              REAL(KIND=8) :: TA
              REAL(KIND=8) :: HN(*)
              REAL(KIND=8) :: HN1(*)
              INTEGER(KIND=4) :: NH
              INTEGER(KIND=4) :: ISTRT
              REAL(KIND=8) :: DD(*)
              REAL(KIND=8) :: SIG(*)
              REAL(KIND=8) :: BB(6)
              LOGICAL(KIND=4) :: BBAR
              INTEGER(KIND=4) :: ISW
            END SUBROUTINE MODLFD
          END INTERFACE 
        END MODULE MODLFD__genmod
