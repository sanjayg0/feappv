# ==================================================================
#   F I N I T E   E L E M E N T   A N A L Y S I S   P R O G R A M
#             FEAPpv (P e r s o n a l   V e r s i o n)
#
#          FEAPpv(C) Regents of the University of California
#                        All Rights Reserved.
# ==================================================================

cmake_minimum_required(VERSION 3.16)

project(FEAPPV 
  VERSION 0.0.0
  LANGUAGES Fortran C
  DESCRIPTION 
  "FEAPpv -- free personal version of the FEAP (A Finite Element Analysis Program)"
)

# Define the feappv executable
add_executable(feappv    main/feappv.f)
add_executable(fe2feappv EXCLUDE_FROM_ALL main/feappv.f)
add_executable(vemfeappv EXCLUDE_FROM_ALL main/feappv.f)
add_executable(igafeappv EXCLUDE_FROM_ALL main/feappv.f)

if ("${CMAKE_Fortran_COMPILER_ID}" MATCHES "GNU")
  # Add compiler options that are specific to gfortran
  target_compile_options(feappv PUBLIC
     -ggdb
     -Og
     -g
     -Wall             # enable a large number of warnings
     -Wextra           # enable additional warnings (good practice)
   # -pedantic   
   # -fimplicit-none   # turn off default implicit typing  
     -fbacktrace
   )

endif()

# Declare directory for include statements
include_directories(include)

# Run configuration for subdirectories
add_subdirectory(elements)
add_subdirectory(program)
add_subdirectory(user)
add_subdirectory(plot)
add_subdirectory(fe2)
# add_subdirectory(fluids)
# add_subdirectory(iga)

if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
  add_subdirectory(windows)
  set_target_properties(feappv PROPERTIES WIN32_EXECUTABLE TRUE)
  # Add options for QuickWin framework
  target_compile_options(feappv PUBLIC /iface:cvf /libs:qwin /c)
  target_link_options(feappv PRIVATE
    /NODEFAULTLIB:"ifconsol.lib" 
    /MANIFEST:NO 
    /INCREMENTAL:NO 
    /SUBSYSTEM:WINDOWS 
    /ENTRY:"WinMainCRTStartup" 
  )
  target_link_libraries(feappv PRIVATE libifcoremt.lib)
else()
  add_subdirectory(unix)
endif()


install(TARGETS feappv DESTINATION ${CMAKE_INSTALL_PREFIX})

#
find_package(BLAS REQUIRED)
find_package(LAPACK REQUIRED)

target_link_libraries(feappv
  PRIVATE
    FEAP_OperatingSystem
    FEAP_User
    LAPACK::LAPACK
    BLAS::BLAS
)

