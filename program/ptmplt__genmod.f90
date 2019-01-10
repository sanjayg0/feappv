        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:28 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PTMPLT__genmod
          INTERFACE 
            SUBROUTINE PTMPLT(FTYP,TTIM,TPL,NTPLTS,NTSTEP)
              INTEGER(KIND=4) :: NTPLTS
              CHARACTER(*) :: FTYP
              REAL(KIND=8) :: TTIM
              REAL(KIND=8) :: TPL(NTPLTS)
              INTEGER(KIND=4) :: NTSTEP
            END SUBROUTINE PTMPLT
          END INTERFACE 
        END MODULE PTMPLT__genmod
