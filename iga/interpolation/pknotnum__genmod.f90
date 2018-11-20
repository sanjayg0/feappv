        !COMPILER-GENERATED INTERFACE MODULE: Fri May 25 07:34:07 2018
        MODULE PKNOTNUM__genmod
          INTERFACE 
            SUBROUTINE PKNOTNUM(LKNOT,KTNUM,KNOTS,NDM,KMAX)
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
              INTEGER(KIND=4) :: LKNOT(0:4,*)
              INTEGER(KIND=4) :: KTNUM(6,*)
              REAL(KIND=8) :: KNOTS(DKNOTIG,*)
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: KMAX
            END SUBROUTINE PKNOTNUM
          END INTERFACE 
        END MODULE PKNOTNUM__genmod
