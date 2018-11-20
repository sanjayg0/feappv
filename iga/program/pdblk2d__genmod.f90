        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:16 2018
        MODULE PDBLK2D__genmod
          INTERFACE 
            SUBROUTINE PDBLK2D(PDFAC,NDISP,LKNOT,LSIDE,NSIDES,NBLKSD,   &
     &NBLK)
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
              INTEGER(KIND=4) :: PDFAC(3)
              REAL(KIND=8) :: NDISP(*)
              INTEGER(KIND=4) :: LKNOT(0:4,*)
              INTEGER(KIND=4) :: LSIDE(2,*)
              INTEGER(KIND=4) :: NSIDES(DSIDEIG,*)
              INTEGER(KIND=4) :: NBLKSD(DBLOKIG,*)
              INTEGER(KIND=4) :: NBLK(14,*)
            END SUBROUTINE PDBLK2D
          END INTERFACE 
        END MODULE PDBLK2D__genmod
