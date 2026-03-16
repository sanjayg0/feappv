# =================================================================
#   F I N I T E   E L E M E N T   A N A L Y S I S   P R O G R A M
#           (c) Regents of the University of California            
#                        All Rights Reserved.
# =================================================================
target_sources(FEAP_Elements
    PRIVATE
        convec2d.f
        convec3d.f
        modltd.f
        therm2d.f
        therm3d.f
        thfx2d.f
        tlcn2d.f
        tlcn3d.f
        trvemat.f
)

