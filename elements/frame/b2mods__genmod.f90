        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:00 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE B2MODS__genmod
          INTERFACE 
            SUBROUTINE B2MODS(D,UL,FORCA,AA,ENERGY,SHP,NDF,NEN,ISW)
              INTEGER(KIND=4) :: NEN
              INTEGER(KIND=4) :: NDF
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: UL(NDF,NEN,*)
              REAL(KIND=8) :: FORCA(4,2)
              REAL(KIND=8) :: AA(4,4,2)
              REAL(KIND=8) :: ENERGY
              REAL(KIND=8) :: SHP(2,3)
              INTEGER(KIND=4) :: ISW
            END SUBROUTINE B2MODS
          END INTERFACE 
        END MODULE B2MODS__genmod
