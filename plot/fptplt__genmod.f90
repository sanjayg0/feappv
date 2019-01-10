        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:43 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FPTPLT__genmod
          INTERFACE 
            SUBROUTINE FPTPLT(XP,YP,TX,NN,NCTR)
              INTEGER(KIND=4) :: NN
              REAL(KIND=4) :: XP(*)
              REAL(KIND=4) :: YP(*)
              CHARACTER(LEN=1) :: TX(NN)
              INTEGER(KIND=4) :: NCTR
            END SUBROUTINE FPTPLT
          END INTERFACE 
        END MODULE FPTPLT__genmod
