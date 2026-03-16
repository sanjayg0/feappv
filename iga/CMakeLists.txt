# =================================================================
#   F I N I T E   E L E M E N T   A N A L Y S I S   P R O G R A M
#           (c) Regents of the University of California            
#                        All Rights Reserved.
# =================================================================
add_library(FEAP_IGA OBJECT)
add_subdirectory(elements)
add_subdirectory(interpolation)
add_subdirectory(main)
add_subdirectory(piegl)
add_subdirectory(plot)
add_subdirectory(program)
add_subdirectory(quadrature)
add_subdirectory(refinement)
add_subdirectory(user)
