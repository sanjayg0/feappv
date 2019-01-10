        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:40 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPROB__genmod
          INTERFACE 
            SUBROUTINE COMPROB(NUMNP,NEN,NEN1,NDF,IX,ID,IC,IELC,IR,JC,  &
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
              INTEGER(KIND=4) :: JC(*)
              LOGICAL(KIND=4) :: BYCOL
              LOGICAL(KIND=4) :: WDIAG
              LOGICAL(KIND=4) :: ALL
            END SUBROUTINE COMPROB
          END INTERFACE 
        END MODULE COMPROB__genmod
