project "libusbp"
	kind "StaticLib"
	language "C"
	staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	includedirs 
	{
		"src/libusbp_internal.h",
		"src/*.h"
	}

	files
	{
		"include/libusbp.h",
		"include/libusbp.hpp",

		"src/async_in_pipe.c",
		"src/error.c",
		"src/error_hresult.c",
		"src/find_device.c",
		"src/libusbp_internal.h",
		"src/list.c",
		"src/pipe_id.c",
		"src/string.c",
	}

	filter "system:linux"
		pic "On"

		systemversion "latest"
		
		files
		{
			"src/linux/async_in_transfer_linux.c",
			"src/linux/device_linux.c",
			"src/linux/error_linux.c",
			"src/linux/generic_handle_linux.c",
			"src/linux/generic_interface_linux.c",
			"src/linux/list_linux.c",
			"src/linux/serial_port_linux.c",
			"src/linux/udev_linux.c",
			"src/linux/usbfd_linux.c"
		}

	filter "system:windows"
		systemversion "latest"

		files
		{
			"src/windows/async_in_transfer_windows.c",
			"src/windows/device_instance_id_windows.c",
			"src/windows/device_windows.c",
			"src/windows/error_windows.c",
			"src/windows/generic_handle_windows.c",
			"src/windows/generic_interface_windows.c",
			"src/windows/interface_windows.c",
			"src/windows/list_windows.c",
			"src/windows/serial_port_windows.c"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"