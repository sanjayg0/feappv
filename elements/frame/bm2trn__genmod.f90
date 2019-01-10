        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:00 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE BM2TRN__genmod
          INTERFACE 
            SUBROUTINE BM2TRN(S,CS,SN,NST,NDF,ITYPE)
              INTEGER(KIND=4) :: NST
              REAL(KIND=8) :: S(NST,*)
              REAL(KIND=8) :: CS
              REAL(KIND=8) :: SN
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: ITYPE
            END SUBROUTINE BM2TRN
          END INTERFACE 
        END MODULE BM2TRN__genmod
