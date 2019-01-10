        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:07 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE C_SHAPE1D__genmod
          INTERFACE 
            SUBROUTINE C_SHAPE1D(WT,UU,P,NS,KNOT_VEC,SHP)
              REAL(KIND=8) :: WT(*)
              REAL(KIND=8) :: UU
              INTEGER(KIND=4) :: P
              INTEGER(KIND=4) :: NS
              REAL(KIND=8) :: KNOT_VEC(*)
              REAL(KIND=8) :: SHP(4,*)
            END SUBROUTINE C_SHAPE1D
          END INTERFACE 
        END MODULE C_SHAPE1D__genmod
