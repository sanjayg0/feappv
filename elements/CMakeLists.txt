# =================================================================
#   F I N I T E   E L E M E N T   A N A L Y S I S   P R O G R A M
#           (c) Regents of the University of California            
#                        All Rights Reserved.
# =================================================================
add_library(FEAP_Elements OBJECT)
target_link_libraries(feappv PRIVATE FEAP_Elements)

add_subdirectory(frame)
add_subdirectory(material)
add_subdirectory(shells)
add_subdirectory(solid1d)
add_subdirectory(solid2d)
add_subdirectory(solid3d)
add_subdirectory(thermal)


