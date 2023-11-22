workspace "HeaderAssembler"
    configurations {"Release64"}
    architecture "x64"
    language   "C++"
    cppdialect "C++11"
    targetdir "Bin/Build"
    objdir    "Bin/objs"
    location "./"
    defines {""}
    characterset("MBCS")
    buildoptions { "/EHsc" }
    project "HeaderAssembler"
        targetname ("HeaderAssembler")
        kind "ConsoleApp"
        files {
                "*.cpp"
        }
        links {

        }