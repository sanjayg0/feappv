        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:14 2018
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
