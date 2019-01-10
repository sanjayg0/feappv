        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:40 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPROA__genmod
          INTERFACE 
            SUBROUTINE COMPROA(NUMNP,NEN,NEN1,NDF,IX,ID,IC,IELC,IR,KP,  &
     &BYCOL,WDIAG,ALL)
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: NEN1
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: IX(NEN1,*)
              INTEGER(KIND=4) :: ID(NDF,*)
              INTEGER(KIND=4) :: IC(*)
              INTEGER(KIND=4) :: IELC(*)
              INTEGER(KIND=4) :: IR(*)
              INTEGER(KIND=4) :: KP
              LOGICAL(KIND=4) :: BYCOL
              LOGICAL(KIND=4) :: WDIAG
              LOGICAL(KIND=4) :: ALL
            END SUBROUTINE COMPROA
          END INTERFACE 
        END MODULE COMPROA__genmod
