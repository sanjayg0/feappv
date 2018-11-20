        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:10 2018
        MODULE C_SHAPE2D__genmod
          INTERFACE 
            SUBROUTINE C_SHAPE2D(WT,UU,VV,ORD,KNO,LK,NEL,NCP,SHP)
              INTEGER(KIND=4) :: NEL
              INTEGER(KIND=4) :: LK
              REAL(KIND=8) :: WT(NEL)
              REAL(KIND=8) :: UU
              REAL(KIND=8) :: VV
              INTEGER(KIND=4) :: ORD(2)
              REAL(KIND=8) :: KNO(LK,2)
              INTEGER(KIND=4) :: NCP(2)
              REAL(KIND=8) :: SHP(10,NEL)
            END SUBROUTINE C_SHAPE2D
          END INTERFACE 
        END MODULE C_SHAPE2D__genmod
