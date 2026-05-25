[![Github All Releases](https://img.shields.io/github/search/sanjayg0/feappv/goto?style=plastic)]()
[![Github All Releases](https://img.shields.io/github/forks/sanjayg0/feappv?style=plastic)]()
[![Github All Releases](https://img.shields.io/github/repo-size/sanjayg0/feappv)]()



# feappv
FEAPpv -- free personal version of the FEAP (A Finite Element Analysis Program)
The program is distributed under the BSD-3 license.  See LICENSE.txt
for details

This version of FEAP is available for free.  It is directly modeled after FEAP but does not contain all of its features, such as a
parallel capability, contact and a number of other advanced features, but newly it provies fe2, igafeap.  Its architecture is generally similar to FEAP's but often is a bit behind in programming style.  Some additional details can be found at http://projects.ce.berkeley.edu/feap/feappv.

For information on FEAP see http://projects.ce.berkeley.edu/feap

There is a FEAP and FEAPpv forum at http://feap.berkeley.edu and there is a nacent wiki at http://feap.berkeley.edu/wiki

Very quick installation instructions for additional details follow the installation
manual for FEAP.

## Windows
In the top level directory you will find a visual studio solution file.  Open this
with Visual Studio (you must also have the Intel compiler installed). Then build the
library project followed by the executable project.

Alternately, open the Intel oneAPI command prompt, and from the FEAPpv
top level directory type 

```devenv feappv_sol.sln /build "Release|x64"```
 
Replace Release by Debug if you want the debug version.

## Mac/Linux
1. Copy main/makefile_default to main/makefile
2. Depending on compiler intel versus gfortran, copy makefile.in_xxxx to makefile.in
3. Edit paths to X11 includes and libraries
4. Type make
