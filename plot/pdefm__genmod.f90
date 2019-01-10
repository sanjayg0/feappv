        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:44 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PDEFM__genmod
          INTERFACE 
            SUBROUTINE PDEFM(X,B,C,ANGL,NDM,NDF,NUMNP,DR,FLAG)
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NDM
              REAL(KIND=8) :: X(NDM,*)
              REAL(KIND=8) :: B(NDF,*)
              REAL(KIND=8) :: C
              REAL(KIND=8) :: ANGL(*)
              INTEGER(KIND=4) :: NUMNP
              REAL(KIND=8) :: DR(3,*)
              LOGICAL(KIND=4) :: FLAG
            END SUBROUTINE PDEFM
          END INTERFACE 
        END MODULE PDEFM__genmod
