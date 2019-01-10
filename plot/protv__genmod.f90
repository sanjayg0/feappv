        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:57 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PROTV__genmod
          INTERFACE 
            SUBROUTINE PROTV(NTY,U,ANGL,NDM,NDF,NUMNP,DU,FLAG)
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NTY(*)
              REAL(KIND=8) :: U(NDF,*)
              REAL(KIND=8) :: ANGL(*)
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NUMNP
              REAL(KIND=8) :: DU(NDF,*)
              LOGICAL(KIND=4) :: FLAG
            END SUBROUTINE PROTV
          END INTERFACE 
        END MODULE PROTV__genmod
