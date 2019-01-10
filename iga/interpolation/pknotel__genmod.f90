        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:03 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PKNOTEL__genmod
          INTERFACE 
            SUBROUTINE PKNOTEL(KNOTS,LKNOT,KNOTNUM,KNOTLEN,KNOTDIV,NDM)
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
              INTEGER(KIND=4) :: LKNOT(0:4,*)
              INTEGER(KIND=4) :: KNOTNUM(*)
              INTEGER(KIND=4) :: KNOTLEN(*)
              INTEGER(KIND=4) :: KNOTDIV(4,*)
              INTEGER(KIND=4) :: NDM
            END SUBROUTINE PKNOTEL
          END INTERFACE 
        END MODULE PKNOTEL__genmod
