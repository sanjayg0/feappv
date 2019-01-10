        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:21:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE STCNPQ__genmod
          INTERFACE 
            SUBROUTINE STCNPQ(IX,D,XL,UL,S,SHP,DT,ST,S_HAT,B_HAT,NDF,NDM&
     &,NEL,NUMNP)
              INTEGER(KIND=4) :: NUMNP
              INTEGER(KIND=4) :: NEL
              INTEGER(KIND=4) :: NDM
              INTEGER(KIND=4) :: NDF
              INTEGER(KIND=4) :: IX(*)
              REAL(KIND=8) :: D(*)
              REAL(KIND=8) :: XL(NDM,*)
              REAL(KIND=8) :: UL(NDF,*)
              REAL(KIND=8) :: S(NEL,*)
              REAL(KIND=8) :: SHP(3,4)
              REAL(KIND=8) :: DT(NUMNP)
              REAL(KIND=8) :: ST(NUMNP,*)
              REAL(KIND=8) :: S_HAT(4)
              REAL(KIND=8) :: B_HAT(4)
            END SUBROUTINE STCNPQ
          END INTERFACE 
        END MODULE STCNPQ__genmod
