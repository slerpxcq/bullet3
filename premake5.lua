project "bullet3"
	kind "StaticLib"
	language "C++"
    cppdialect "C++17"
	staticruntime "on"
    vectorextensions "AVX2"
    floatingpoint "fast"

    targetdir "%{wks.location}/bin/%{prj.name}/%{cfg.buildcfg}"
    objdir "%{wks.location}/obj/%{prj.name}/%{cfg.buildcfg}"

    files {
        "src/*.cpp"
        --"src/**.h"
    }

	includedirs {
		"src"
	}

    defines {
        "__BT_DISABLE_SSE__"
    }

    filter "system:windows"
        systemversion "latest"
        defines {
			"_CRT_SECURE_NO_WARNINGS",
            "WIN32",
            "_WINDOWS"
        }

        disablewarnings {
            "4244",
            "4305"
        }

    filter "configurations:Debug"
        symbols "on"

    filter "configurations:Release"
        optimize "on"

