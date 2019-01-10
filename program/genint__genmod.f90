        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:48 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GENINT__genmod
          INTERFACE 
            SUBROUTINE GENINT(ND,IX,NIX,NUM,CNAME,CARG,PRT,PRTH,ERR,TYPE&
     &)
              INTEGER(KIND=4) :: NIX
              INTEGER(KIND=4) :: ND
              INTEGER(KIND=4) :: IX(NIX,*)
              INTEGER(KIND=4) :: NUM
              CHARACTER(*) :: CNAME
              CHARACTER(*) :: CARG
              LOGICAL(KIND=4) :: PRT
              LOGICAL(KIND=4) :: PRTH
              LOGICAL(KIND=4) :: ERR
              INTEGER(KIND=4) :: TYPE
            END SUBROUTINE GENINT
          END INTERFACE 
        END MODULE GENINT__genmod
