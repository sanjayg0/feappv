        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:55 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE OPNUM__genmod
          INTERFACE 
            SUBROUTINE OPNUM(IX,ND,LN,NE,NDW,MSUM,NFRNT,NNID,NUMNP,NUMEL&
     &,NEN,NEN1,PRT)
              INTEGER(KIND=4) :: NEN1
              INTEGER(KIND=4) :: NUMEL
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: IX(NEN1,*)
              INTEGER(KIND=4) :: ND(NUMNP)
              INTEGER(KIND=4) :: LN(NUMNP)
              INTEGER(KIND=4) :: NE(*)
              INTEGER(KIND=4) :: NDW(NUMNP)
              INTEGER(KIND=4) :: MSUM(NUMEL)
              INTEGER(KIND=4) :: NFRNT(NUMNP)
              INTEGER(KIND=4) :: NNID(NUMNP)
              INTEGER(KIND=4) :: NEN
              LOGICAL(KIND=4) :: PRT
            END SUBROUTINE OPNUM
          END INTERFACE 
        END MODULE OPNUM__genmod
