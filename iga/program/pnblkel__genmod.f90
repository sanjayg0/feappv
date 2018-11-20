        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:19 2018
        MODULE PNBLKEL__genmod
          INTERFACE 
            SUBROUTINE PNBLKEL(NUREN,TNUME,KNOTS,LKNOT,LSIDE,NSIDES,    &
     &NBLKSD,NBLK,KTNUM)
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
              INTEGER(KIND=4) :: NUREN
              INTEGER(KIND=4) :: TNUME
              REAL(KIND=8) :: KNOTS(DKNOTIG,*)
              INTEGER(KIND=4) :: LKNOT(0:4,*)
              INTEGER(KIND=4) :: LSIDE(2,*)
              INTEGER(KIND=4) :: NSIDES(DSIDEIG,*)
              INTEGER(KIND=4) :: NBLKSD(DBLOKIG,*)
              INTEGER(KIND=4) :: NBLK(14,*)
              INTEGER(KIND=4) :: KTNUM(6,*)
            END SUBROUTINE PNBLKEL
          END INTERFACE 
        END MODULE PNBLKEL__genmod
