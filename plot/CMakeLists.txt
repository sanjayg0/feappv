# =================================================================
#   F I N I T E   E L E M E N T   A N A L Y S I S   P R O G R A M
#           (c) Regents of the University of California            
#                        All Rights Reserved.
# =================================================================
add_library(FEAP_Plot OBJECT)
target_link_libraries(feappv PRIVATE FEAP_Plot)

target_sources(FEAP_Plot
    PRIVATE
        dtot_pl.f
        fpplcl.f
        fpplps.f
        fppsdu.f
        fppsin.f
        fppsop.f
        fppspl.f
        fptplt.f
        frame.f
        lclip.f
        maxcor.f
        mergei.f
        merges.f
        pdefm.f
        perspe.f
        perspj.f
        perspz.f
        pfacepqr.f
        pfacev.f
        pfacex.f
        pfeap.f
        phide.f
        pjstrs.f
        plbk27.f
        plbkpqr.f
        plbord.f
        plbrk8.f
        plface.f
        plfacn.f
        plfacx.f
        plftyp.f
        pline.f
        plot2d.f
        plotl.f
        plqud4.f
        plqud8.f
        pltaxs.f
        pltbou.f
        pltcon.f
        pltcor.f
        pltctx.f
        pltecn.f
        pltelc.f
        pltet10.f
        pltet4.f
        pltfor.f
        pltlfl.f
        pltln2.f
        pltln3.f
        pltord.f
        pltprf.f
        pltpt1.f
        pltq16.f
        pltqfl.f
        pltri3.f
        pltri6.f
        pltris.f
        pltstr.f
        plview.f
        pnumna.f
        ppbox.f
        ppeye.f
        pplotf.f
        protv.f
        psetip.f
        pwind.f
        pzerol.f
        rprint.f
        setclp.f
        setfor.f
        upltlib.f
        vecp.f
        vem_compp.f
        vem_plcon.f
        visbl.f
        xcompp.f
        xpline.f
        zoom.f
)

