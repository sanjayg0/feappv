        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:04 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
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
