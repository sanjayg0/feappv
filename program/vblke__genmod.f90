        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:40 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE VBLKE__genmod
          INTERFACE 
            SUBROUTINE VBLKE(NR,NS,NT,IX,NI,NE,NF,NEN1,MAT,NTYP,DLAYER, &
     &ILR)
              INTEGER(KIND=4) :: NEN1
              INTEGER(KIND=4) :: NR
              INTEGER(KIND=4) :: NS
              INTEGER(KIND=4) :: NT
              INTEGER(KIND=4) :: IX(NEN1,*)
              INTEGER(KIND=4) :: NI
              INTEGER(KIND=4) :: NE
              INTEGER(KIND=4) :: NF
              INTEGER(KIND=4) :: MAT
              INTEGER(KIND=4) :: NTYP
              INTEGER(KIND=4) :: DLAYER
              INTEGER(KIND=4) :: ILR(*)
            END SUBROUTINE VBLKE
          END INTERFACE 
        END MODULE VBLKE__genmod
