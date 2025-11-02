# =================================================================
#   F I N I T E   E L E M E N T   A N A L Y S I S   P R O G R A M
#           (c) Regents of the University of California            
#                        All Rights Reserved.
# =================================================================
add_library(FEAP_OperatingSystem OBJECT)


target_sources(FEAP_OperatingSystem
    PRIVATE
        cinput.f
        clpan.f
        dplot.f
        etime.f
        pflush.f
        plabl.f
        plclos.f
        pleigt.f
        plline.f
        plopen.f
        plot9.f
        plstop.f
        plstrt.f
        pltcur.f
        pltdos.f
        pltefl.f
        pltelm.f
        pltext.f
        pltftx.f
        pltime.f
        pltnod.f
        pppcol.f
        pstart.f
        pwopn.f
        tplot.f
)
