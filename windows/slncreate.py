#      * * F E A P * * A Finite Element Analysis Program

#....  Copyright (c) 1984-2026: Regents of the University of California
#                               All rights reserved

#-----[--.----+----.----+----.-----------------------------------------]
#     Modification log                                Date (dd/mm/year)
#       Original version                                    03/10/2026
#       1. Drop QuickWin; console subsystem with Win32 GDI  29/05/2026
#-----[----------------------------------------------------------------]
#      Purpose:  Generate *.sln and *.vfproj for Visual Studio

#-----[----------------------------------------------------------------]
import os
import uuid

def generate_guid():
    return str(uuid.uuid4()).upper()

# Configuration
PROJECT_NAME_LIB = "feappv_lib"
PROJECT_NAME_EXE = "feappv_exe"
SOLUTION_NAME    = "feappv_sol"

# Intel Fortran Project Type GUID
FORTRAN_PROJ_TYPE_GUID = "{6989167D-11E4-40FE-8C1A-2192A86A7E90}"

LIB_GUID  = generate_guid()
EXE_GUID  = generate_guid()
SOLN_GUID = generate_guid()

# Path Logic: Assume script is in a folder windows subfolder and run from there
SCRIPT_DIR   = os.path.dirname(os.path.abspath(__file__))
PROJECT_ROOT = os.path.dirname(SCRIPT_DIR)

def get_fortran_files(directories):
    files = []
    for d in directories:
        full_path = os.path.join(PROJECT_ROOT, d)
        if os.path.exists(full_path):
            for f in sorted(os.listdir(full_path)):
                # Including .f, .for, and include files .h/.inc
                if f.lower().endswith(('.f', '.f90')):
                    files.append(os.path.join(d, f))
    return files

lib_dirs = ['elements/frame',   'elements/material', 'elements/shells',  'elements/solid1d', \
            'elements/solid2d', 'elements/solid3d',  'elements/thermal', 'plot', 'program', 'user', 'windows']
exe_dirs = ['main']

lib_files = get_fortran_files(lib_dirs)
exe_files = get_fortran_files(exe_dirs)

def write_vfproj(filename, proj_guid, is_exe=False):

    config_type = "typeExecutable" if is_exe else "typeStaticLibrary"

    runtime_library = "rtMultiThreadedDLL"
    compiler_opts = f'SuppressStartupBanner="true" \
                      AdditionalIncludeDirectories="include" \
                      RuntimeLibrary="{runtime_library}"'

    druntime_library = "rtMultiThreadedDebugDLL"
    dcompiler_opts = f'SuppressStartupBanner="true" \
                       DebugInformationFormat="debugEnabled" \
                       Optimization="optimizeDisabled" \
                       Traceback = "true" \
                       WarnInterfaces="true" \
                       StackFrameCheck="true" \
                       AdditionalIncludeDirectories="include" \
                       RuntimeLibrary="{druntime_library}"'
    
    out_file = os.path.join(PROJECT_ROOT, f"{filename}.vfproj")
    
    with open(out_file, "w", encoding="UTF-8") as f:
        f.write('<?xml version="1.0" encoding="UTF-8"?>\n')

        if is_exe:
          f.write('<VisualStudioProject ProjectCreator="Intel Fortran" '
                                       'Keyword="Console" '
                                       'Version="11.0" '
                                       f'ProjectIdGuid="{{{proj_guid}}}">\n')
        else:
          f.write('<VisualStudioProject ProjectType="typeStaticLibrary" ProjectCreator="Intel Fortran" '
                                       'Keyword="Static Library" ' 
                                       'Version="11.0" ' 
                                       f'ProjectIdGuid="{{{proj_guid}}}">\n')

        f.write('\t<Platforms><Platform Name="x64"/></Platforms>\n')
        f.write('\t<Configurations>\n')

        f.write(f'\t\t<Configuration Name="Debug|x64" UseCompiler="ifxCompiler" ConfigurationType="{config_type}">\n')
        f.write(f'\t\t\t<Tool Name="VFFortranCompilerTool" {dcompiler_opts}/>\n')
        if is_exe:
          f.write('\t\t\t<Tool Name="VFLinkerTool" LinkIncremental="linkIncrementalNo" SuppressStartupBanner="true" '
                  'GenerateDebugInformation="true" SubSystem="subSystemConsole" '
                  'AdditionalDependencies="user32.lib gdi32.lib"/>\n')
          f.write('\t\t\t<Tool Name="VFManifestTool" SuppressStartupBanner="true"/>\n')
        f.write('\t\t\t<Tool Name="VFMidlTool" SuppressStartupBanner="true" TargetEnvironment="midlTargetAMD64"/>\n')
        f.write('\t\t</Configuration>\n')

        f.write(f'\t\t<Configuration Name="Release|x64" UseCompiler="ifxCompiler" ConfigurationType="{config_type}">\n')
        f.write(f'\t\t\t<Tool Name="VFFortranCompilerTool" {compiler_opts}/>\n')
        if is_exe:
          f.write('\t\t\t<Tool Name="VFLinkerTool" SuppressStartupBanner="true" SubSystem="subSystemConsole" '
                  'AdditionalDependencies="user32.lib gdi32.lib"/>\n')
          f.write('\t\t\t<Tool Name="VFManifestTool" SuppressStartupBanner="true"/>\n')
        f.write('\t\t\t<Tool Name="VFMidlTool" SuppressStartupBanner="true" TargetEnvironment="midlTargetAMD64"/>\n')
        f.write('\t\t</Configuration>\n')
        
        f.write('\t</Configurations>\n')
        f.write('\t<Files>\n')
        
        # Add the files with relative paths
        current_files = exe_files if is_exe else lib_files
        for file_path in current_files:
          f.write(f'\t\t<File RelativePath=".\\{file_path}"/>\n')
 
        if is_exe:
          f.write(f'\t\t<File RelativePath=".\\$(Platform)\\$(Configuration)\\{PROJECT_NAME_LIB}.lib"/>\n')
 
            
        f.write('\t</Files>\n')
        f.write('</VisualStudioProject>')

def write_sln():
    sln_path = os.path.join(PROJECT_ROOT, f"{SOLUTION_NAME}.sln")
    with open(sln_path, "w", encoding="UTF-8") as f:
        f.write("\nMicrosoft Visual Studio Solution File, Format Version 12.00\n")
        f.write("# Visual Studio Version 17\n")
        f.write("VisualStudioVersion = 17.14.36915.13 d17.14\n")
        f.write("MinimumVisualStudioVersion = 10.0.40219.1\n")
        f.write(f'Project("{FORTRAN_PROJ_TYPE_GUID}") = "{PROJECT_NAME_LIB}", "{PROJECT_NAME_LIB}.vfproj", "{{{LIB_GUID}}}"\nEndProject\n')
        f.write(f'Project("{FORTRAN_PROJ_TYPE_GUID}") = "{PROJECT_NAME_EXE}", "{PROJECT_NAME_EXE}.vfproj", "{{{EXE_GUID}}}"\n')
        f.write(f'\tProjectSection(ProjectDependencies) = postProject\n\t\t{{{LIB_GUID}}} = {{{LIB_GUID}}}\n\tEndProjectSection\nEndProject\n')
        f.write("Global\n")
        f.write("\tGlobalSection(SolutionConfigurationPlatforms) = preSolution\n")
        f.write("\t\tDebug|x64 = Debug|x64\n")
        f.write("\t\tRelease|x64 = Release|x64\n")
        f.write("\tEndGlobalSection\n")
        f.write("\tGlobalSection(ProjectConfigurationPlatforms) = postSolution\n")
        f.write(f'\t\t{{{LIB_GUID}}}.Debug|x64.ActiveCfg = Debug|x64\n')
        f.write(f'\t\t{{{LIB_GUID}}}.Debug|x64.Build.0 = Debug|x64\n')
        f.write(f'\t\t{{{LIB_GUID}}}.Release|x64.ActiveCfg = Release|x64\n')
        f.write(f'\t\t{{{LIB_GUID}}}.Release|x64.Build.0 = Release|x64\n')
        f.write(f'\t\t{{{EXE_GUID}}}.Debug|x64.ActiveCfg = Debug|x64\n')
        f.write(f'\t\t{{{EXE_GUID}}}.Debug|x64.Build.0 = Debug|x64\n')
        f.write(f'\t\t{{{EXE_GUID}}}.Release|x64.ActiveCfg = Release|x64\n')
        f.write(f'\t\t{{{EXE_GUID}}}.Release|x64.Build.0 = Release|x64\n')
        f.write("\tEndGlobalSection\n")
        f.write("\tGlobalSection(SolutionProperties) = preSolution\n")
        f.write("\t\tHideSolutionNode = FALSE\n")
        f.write("\tEndGlobalSection\n")
        f.write("\tGlobalSection(ExtensibilityGlobals) = postSolution\n")
        f.write(f'\t\tSolutionGuid = {{{SOLN_GUID}}}\n')
        f.write("\tEndGlobalSection\n")
        f.write("EndGlobal\n")


if __name__ == "__main__":
    write_vfproj(PROJECT_NAME_LIB, LIB_GUID, is_exe=False)
    write_vfproj(PROJECT_NAME_EXE, EXE_GUID, is_exe=True)
    write_sln()
    print(f"Build System Generated Successfully.")
    print(f"Location: {PROJECT_ROOT}")
    print(f"Compiler: Intel Fortran (ifx)")
    print(f"Graphics: native Win32 (winplot_mod) for {PROJECT_NAME_EXE}")
