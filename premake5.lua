VULKAN_SDK = os.getenv("VULKAN_SDK")

project "imgui"
	kind "StaticLib"
	language "C++"
	cppdialect "C++latest"
	staticruntime "on"

	targetdir "%{wks.location}/Bin/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
  objdir "%{wks.location}/Bin-Int/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

	files
	{
		"imconfig.h",
		"imgui.h",
		"imgui.cpp",
		"imgui_draw.cpp",
		"imgui_internal.h",
		"imgui_tables.cpp",
		"imgui_widgets.cpp",
		"imstb_rectpack.h",
		"imstb_textedit.h",
		"imstb_truetype.h",
		"imgui_demo.cpp",
		"backends/imgui_impl_vulkan.h",
		"backends/imgui_impl_vulkan.cpp",
		"backends/imgui_impl_glfw.h",
		"backends/imgui_impl_glfw.cpp"
	}

	includedirs
  {
		".",
		"%{VULKAN_SDK}/Include",
  }

	links
  {
    "vulkan-1.lib"
  }

  libdirs
  {
    "%{VULKAN_SDK}/Lib"
  }

	filter "system:windows"
		systemversion "latest"
	
	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
		
	filter "configurations:Release"
		runtime "Release"
		optimize "on"