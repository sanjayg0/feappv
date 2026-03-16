# =================================================================
#   F I N I T E   E L E M E N T   A N A L Y S I S   P R O G R A M
#           (c) Regents of the University of California            
#                        All Rights Reserved.
# =================================================================
target_sources(FEAP_Elements
    PRIVATE
        bbar2m.f
        bmat2d.f
        fbar2m.f
        fld2d1.f
        fld2d2.f
        gvec2d.f
        interp2d.f
        kine2d.f
        kine2m.f
        mass2d.f
        quadr2d.f
        rays2d.f
        resid2d.f
        shpi2d.f
        slcn2d.f
        sld2d1.f
        sld2d2.f
        sld2d3.f
        solid2d.f
        strn2d.f
        strn2m.f
)

