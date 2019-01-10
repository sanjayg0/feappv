        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:24:14 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PLBLK3D__genmod
          INTERFACE 
            SUBROUTINE PLBLK3D(PFAC,NPRES,LKNOT,LSIDE,NSIDES,NBLKSD,NBLK&
     &)
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
              INTEGER(KIND=4) :: PFAC(5)
              REAL(KIND=8) :: NPRES(3)
              INTEGER(KIND=4) :: LKNOT(0:4,*)
              INTEGER(KIND=4) :: LSIDE(2,*)
              INTEGER(KIND=4) :: NSIDES(DSIDEIG,*)
              INTEGER(KIND=4) :: NBLKSD(DBLOKIG,*)
              INTEGER(KIND=4) :: NBLK(14,*)
            END SUBROUTINE PLBLK3D
          END INTERFACE 
        END MODULE PLBLK3D__genmod
