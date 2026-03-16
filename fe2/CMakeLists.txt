# =================================================================
#   F I N I T E   E L E M E N T   A N A L Y S I S   P R O G R A M
#           (c) Regents of the University of California            
#                        All Rights Reserved.
# =================================================================
find_package(MPI)

if (NOT MPI_FOUND)
  return()
endif()

add_library(FEAP_fe2)
target_link_libraries(FEAP_fe2 PRIVATE MPI::MPI_Fortran)
target_link_libraries(feappv PRIVATE FEAP_fe2)


target_sources(FEAP_fe2
    PRIVATE
        mpi_start_feap.f
        parsend.f
        parstop.f
        pfe2clean.f
        pfe2outf.f
        pfe2rve.f
        pfe2setd.f
        pfe2setio.f
        pfe2setrv.f
        pfe2solv.f
        pforma.f
        pform.f
        pmacr9.f
        rvemat.f
        rvesr.f
        srvemat.f
        tinput.f
        trvemat.f
        uprob.f
)

