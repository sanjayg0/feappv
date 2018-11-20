        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:25 2018
        MODULE POUTBLK1D__genmod
          INTERFACE 
            SUBROUTINE POUTBLK1D(BLK,UU,RR,KNOTS,NSIDES,LKNOT,LSIDE,NBLK&
     &,KTNUM,NBLKSD)
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
              INTEGER(KIND=4) :: BLK
              REAL(KIND=8) :: UU
              INTEGER(KIND=4) :: RR
              REAL(KIND=8) :: KNOTS(DKNOTIG,*)
              INTEGER(KIND=4) :: NSIDES(DSIDEIG,*)
              INTEGER(KIND=4) :: LKNOT(0:4,*)
              INTEGER(KIND=4) :: LSIDE(2,*)
              INTEGER(KIND=4) :: NBLK(14,*)
              INTEGER(KIND=4) :: KTNUM(6,*)
              INTEGER(KIND=4) :: NBLKSD(DBLOKIG,*)
            END SUBROUTINE POUTBLK1D
          END INTERFACE 
        END MODULE POUTBLK1D__genmod
