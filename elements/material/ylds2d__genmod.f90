        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:06 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE YLDS2D__genmod
          INTERFACE 
            FUNCTION YLDS2D(D,SIGTR,ALP,ETA,DD,BETA,EPN,LAM0,HPRIM)
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: SIGTR(3)
              REAL(KIND=8) :: ALP(3)
              REAL(KIND=8) :: ETA(3)
              REAL(KIND=8) :: DD(6,6)
              REAL(KIND=8) :: BETA
              REAL(KIND=8) :: EPN
              REAL(KIND=8) :: LAM0
              REAL(KIND=8) :: HPRIM
              REAL(KIND=8) :: YLDS2D
            END FUNCTION YLDS2D
          END INTERFACE 
        END MODULE YLDS2D__genmod
