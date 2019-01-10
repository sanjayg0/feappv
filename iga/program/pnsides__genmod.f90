        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:18 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PNSIDES__genmod
          INTERFACE 
            SUBROUTINE PNSIDES(LSIDE,NSIDES,PRT)
              COMMON/IGDATA/ DKNOTIG,LKNOTIG,NKNOTIG,DSIDEIG,NSIDEIG,   &
     &DBLOKIG,NBLOKIG,NSTRPIG
                INTEGER(KIND=4) :: DKNOTIG
                INTEGER(KIND=4) :: LKNOTIG
                INTEGER(KIND=4) :: NKNOTIG
                INTEGER(KIND=4) :: DSIDEIG
                INTEGER(KIND=4) :: NSIDEIG
                INTEGER(KIND=4) :: DBLOKIG
                INTEGER(KIND=4) :: NBLOKIG
                INTEGER(KIND=4) :: NSTRPIG
              INTEGER(KIND=4) :: LSIDE(2,*)
              INTEGER(KIND=4) :: NSIDES(DSIDEIG,*)
              LOGICAL(KIND=4) :: PRT
            END SUBROUTINE PNSIDES
          END INTERFACE 
        END MODULE PNSIDES__genmod
