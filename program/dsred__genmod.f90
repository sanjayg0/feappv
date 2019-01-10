        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:44 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE DSRED__genmod
          INTERFACE 
            FUNCTION DSRED(AU,AD,JH)
              INTEGER(KIND=4) :: JH
              REAL(KIND=8) :: AU(JH)
              REAL(KIND=8) :: AD(JH)
              REAL(KIND=8) :: DSRED
            END FUNCTION DSRED
          END INTERFACE 
        END MODULE DSRED__genmod
