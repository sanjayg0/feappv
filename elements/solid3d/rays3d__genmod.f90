        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:29 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE RAYS3D__genmod
          INTERFACE 
            SUBROUTINE RAYS3D(D,SHP,SHPBAR,SIG,DR,VL,NDF,NEL,MIXED)
              INTEGER(KIND=4) :: NDF
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: SHP(4,*)
              REAL(KIND=8) :: SHPBAR(3,*)
              REAL(KIND=8) :: SIG(*)
              REAL(KIND=8) :: DR(6,6)
              REAL(KIND=8) :: VL(NDF,*)
              INTEGER(KIND=4) :: NEL
              LOGICAL(KIND=4) :: MIXED
            END SUBROUTINE RAYS3D
          END INTERFACE 
        END MODULE RAYS3D__genmod
