        !COMPILER-GENERATED INTERFACE MODULE: Thu Jan 10 13:22:59 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE VEM_PLCON__genmod
          INTERFACE 
            SUBROUTINE VEM_PLCON(K,NC,NEL,XL,IPLT,ICL,V,VC,CONT)
              INTEGER(KIND=4) :: K
              INTEGER(KIND=4) :: NC
              INTEGER(KIND=4) :: NEL
              REAL(KIND=8) :: XL(3,*)
              INTEGER(KIND=4) :: IPLT(*)
              INTEGER(KIND=4) :: ICL(*)
              REAL(KIND=8) :: V(*)
              REAL(KIND=8) :: VC(*)
              LOGICAL(KIND=4) :: CONT
            END SUBROUTINE VEM_PLCON
          END INTERFACE 
        END MODULE VEM_PLCON__genmod
