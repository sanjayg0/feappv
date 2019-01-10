        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:12 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FULL3D_W__genmod
          INTERFACE 
            SUBROUTINE FULL3D_W(CB,NBIV,NLL,WL,WB)
              INTEGER(KIND=4) :: NLL
              INTEGER(KIND=4) :: NBIV
              REAL(KIND=8) :: CB(NLL,NBIV)
              REAL(KIND=8) :: WL(*)
              REAL(KIND=8) :: WB(*)
            END SUBROUTINE FULL3D_W
          END INTERFACE 
        END MODULE FULL3D_W__genmod
