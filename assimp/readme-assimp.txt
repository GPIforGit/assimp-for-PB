There are two ways to use assimp:
--------------------------------

1) Simple copy the directory to your project and 
	XIncludeFile "assimp/assimp.pbi"
2) use the install-script, this will copy all the include-files to your pure-basic-compiler-directory. You can then use without any additional task use "assimp" with:
	XIncludeFile #PB_Compiler_Home + "Include/assimp/assimp.pbi"

I only converted the c-base-importer. All functions, structures and constants are in a module "ai", so replace any prefix ai to ai::, for example ai::ImportFile() instead of aiImportFile().
	
 
Additional installation on windows
----------------------------------
I include the necassary binaries - only copy the dll to your programm directory.
 
 
Additional installation on macos
--------------------------------
Only in short form, you must compile assimp for yourself:
 - download http://assimp.org/index.php/downloads
 - download and install https://cmake.org/download/
 - run cmake, select above the assimp-sourcecode and are "build"-path
 - click on "configure"-Button and select "XCODE"
 - check "BUILD_FRAMEWORK" in the config
 - click generate
 - click "open Project" - XCODE should open
 - Menu - Project - Scheme: select assimp
 - menu - project - scheme - edit scheme. switch "build configuration" from "debug" to "release"
 - menu - project - build
 - copy "build"/code/Release/assimp.framework to /Library/Frameworks/
 in some cases you need to resign the framework, open a terminal
 cd /Library/Frameworks/assimp.framework/
 codesign -f -s - assimp
 
Additional installation on Linux
--------------------------------
you must download the package "assimp5". Older version may work, but you must change the libname in the assimp.pbi