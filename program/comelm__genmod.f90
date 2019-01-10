        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:39 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMELM__genmod
          INTERFACE 
            SUBROUTINE COMELM(ID,IX,IR,NDF,NEN,KPO,KP,NEQ,BYCOL,WDIAG,  &
     &ALL)
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: ID(NDF,*)
              INTEGER(KIND=4) :: IX(*)
              INTEGER(KIND=4) :: IR(*)
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: KPO
              INTEGER(KIND=4) :: KP
              INTEGER(KIND=4) :: NEQ
              LOGICAL(KIND=4) :: BYCOL
              LOGICAL(KIND=4) :: WDIAG
              LOGICAL(KIND=4) :: ALL
            END SUBROUTINE COMELM
          END INTERFACE 
        END MODULE COMELM__genmod
