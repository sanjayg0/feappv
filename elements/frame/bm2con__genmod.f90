        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:00 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE BM2CON__genmod
          INTERFACE 
            SUBROUTINE BM2CON(D,CC,STRS,DEF,ISW)
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: CC(3,3,2)
              REAL(KIND=8) :: STRS(3,2)
              REAL(KIND=8) :: DEF(3,2)
              INTEGER(KIND=4) :: ISW
            END SUBROUTINE BM2CON
          END INTERFACE 
        END MODULE BM2CON__genmod
