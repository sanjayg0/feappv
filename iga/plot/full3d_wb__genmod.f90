        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:12 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FULL3D_WB__genmod
          INTERFACE 
            SUBROUTINE FULL3D_WB(CS,CB,NUNI,NBIV,NLL,WL,WB)
              INTEGER(KIND=4) :: NLL
              INTEGER(KIND=4) :: NBIV
              INTEGER(KIND=4) :: NUNI
              REAL(KIND=8) :: CS(NUNI,NUNI)
              REAL(KIND=8) :: CB(NLL,NBIV)
              REAL(KIND=8) :: WL(*)
              REAL(KIND=8) :: WB(*)
            END SUBROUTINE FULL3D_WB
          END INTERFACE 
        END MODULE FULL3D_WB__genmod
