# =================================================================
#   F I N I T E   E L E M E N T   A N A L Y S I S   P R O G R A M
#           (c) Regents of the University of California            
#                        All Rights Reserved.
# =================================================================
add_library(FEAP_fluids OBJECT)

target_sources(FEAP_fluids
    PRIVATE
        ale_elas.f
        ckbrkq.f
        elmlib.f
        flcn2d.f
        flu2d1.f
        flu2d2.f
        flu2d3.f
        flu2d4.f
        flu2d5.f
        flu2d6.f
        flu2d9.f
        flu3d1.f
        flu3d2.fold
        flu3d3.f
        flu3d9.f
        fluid2d.f
        fluid3d.f
        incom2d.f
        incom.f
        iner2d.f
        influid.f
        modlfl.f
        newtonian.f
        pelnum.f
        p_split.f
        pstab2d.f
        pstab3d.f
        stream_2d.f
        strnr2d.f
        strnr3d.f
        umacr1.f
        umacr2.f
)

