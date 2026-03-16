# =================================================================
#   F I N I T E   E L E M E N T   A N A L Y S I S   P R O G R A M
#           (c) Regents of the University of California            
#                        All Rights Reserved.
# =================================================================
add_library(FEAP_OperatingSystem OBJECT)

find_package(X11 REQUIRED)

target_include_directories(FEAP_OperatingSystem PRIVATE ${X11_INCLUDE_DIR})

target_sources(FEAP_OperatingSystem
    PRIVATE
        clpan.f
        dplot.f
        pfclip.f
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
        pltefl.f
        pltelm.f
        pltext.f
        pltftx.f
        pltime.f
        pltnod.f
        pppcol.f
        pstart.f
        tplot.f
        x11u.c
)

target_link_libraries(FEAP_OperatingSystem PRIVATE ${X11_LIBRARIES})
