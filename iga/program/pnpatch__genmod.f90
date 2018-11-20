        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:20 2018
        MODULE PNPATCH__genmod
          INTERFACE 
            SUBROUTINE PNPATCH(KNOTS,NSIDES,LKNOT,LSIDE,NBLK,NBLKSD,    &
     &PFLAG)
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
              REAL(KIND=8) :: KNOTS(DKNOTIG,*)
              INTEGER(KIND=4) :: NSIDES(DSIDEIG,*)
              INTEGER(KIND=4) :: LKNOT(0:4,*)
              INTEGER(KIND=4) :: LSIDE(2,*)
              INTEGER(KIND=4) :: NBLK(14,*)
              INTEGER(KIND=4) :: NBLKSD(DBLOKIG,*)
              LOGICAL(KIND=4) :: PFLAG
            END SUBROUTINE PNPATCH
          END INTERFACE 
        END MODULE PNPATCH__genmod
