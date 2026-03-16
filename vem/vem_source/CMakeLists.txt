# =================================================================
#   F I N I T E   E L E M E N T   A N A L Y S I S   P R O G R A M
#           (c) Regents of the University of California            
#                        All Rights Reserved.
# =================================================================
target_sources(FEAP_VEM
    PRIVATE
        interp2d.f
        quadr2d.f
        slcn2d.f
        solid2d.f
        therm2d.f
        umacr1.f
        umani1.f
        vem_cent2d.f
        vem_compp.f
        vem_new.f
        vem_pascal.f
        vem_plcon.f
        vem_pmat2d.f
        vem_proj2d.f
        vem_slcn.f
        vem_stab2d.f
        vem_thcn.f
)
target_include_directories(FEAP_VEM PUBLIC ${CMAKE_CURRENT_LIST_DIR})

