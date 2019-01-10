        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:54 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE NODEW__genmod
          INTERFACE 
            SUBROUTINE NODEW(NDW,MSUM,IX,NNID,NEN,NEN1,NUMNP,NUMEL,     &
     &NSTART)
              INTEGER(KIND=4) :: NUMEL
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NEN1
              INTEGER(KIND=4) :: NDW(NUMNP)
              INTEGER(KIND=4) :: MSUM(NUMEL)
              INTEGER(KIND=4) :: IX(NEN1,NUMEL)
              INTEGER(KIND=4) :: NNID(NUMNP)
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: NSTART
            END SUBROUTINE NODEW
          END INTERFACE 
        END MODULE NODEW__genmod
