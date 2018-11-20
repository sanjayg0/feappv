        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:18 2018
        MODULE PNBLK3EL__genmod
          INTERFACE 
            SUBROUTINE PNBLK3EL(NDM,NUREN,TNUME,KNOTS,LKNOT,LSIDE,NBLKSD&
     &,NBLK,KTNUM)
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
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NUREN
              INTEGER(KIND=4) :: TNUME
              REAL(KIND=8) :: KNOTS(DKNOTIG,*)
              INTEGER(KIND=4) :: LKNOT(0:4,*)
              INTEGER(KIND=4) :: LSIDE(2,*)
              INTEGER(KIND=4) :: NBLKSD(DBLOKIG,*)
              INTEGER(KIND=4) :: NBLK(14,*)
              INTEGER(KIND=4) :: KTNUM(6,*)
            END SUBROUTINE PNBLK3EL
          END INTERFACE 
        END MODULE PNBLK3EL__genmod
