if (NOT DEFINED XMR_STAK_DEP_ROOT)
  message (FATAL_ERROR "XMR_STAK_DEP_ROOT not defined.")
endif ()

if (NOT EXISTS "${XMR_STAK_DEP_ROOT}")
  message (FATAL_ERROR "XMR_STAK_DEP_ROOT=[${XMR_STAK_DEP_ROOT}] does not exist.")
endif ()

if (NOT DEFINED CMAKE_INSTALL_PREFIX)
  message (FATAL_ERROR "CMAKE_INSTALL_PREFIX not defined.")
endif ()

if (NOT EXISTS "${CMAKE_INSTALL_PREFIX}")
  message (FATAL_ERROR "CMAKE_INSTALL_PREFIX=[${CMAKE_INSTALL_PREFIX}] does not exist.")
endif ()

file (GLOB _crt_files "${XMR_STAK_DEP_ROOT}/crt/*.*")

if (NOT DEFINED ENV{CUDA_PATH})
  message (FATAL_ERROR "CUDA_PATH environment variable not defined.")
endif ()
file (GLOB _cuda_files "$ENV{CUDA_PATH}/bin/nvrtc*.dll")

foreach (_file_to_copy IN LISTS _crt_files _cuda_files)
  message ("***** Copying: [${_file_to_copy}]")
  file (COPY ${_file_to_copy} DESTINATION "${CMAKE_INSTALL_PREFIX}/bin")
endforeach ()

include (BundleUtilities)

file (GLOB _exe_files "${CMAKE_INSTALL_PREFIX}/bin/cornelius.exe")
file (GLOB _dll_files "${CMAKE_INSTALL_PREFIX}/bin/xmrstak*.dll")

file (TO_CMAKE_PATH "$ENV{ProgramFiles}/OpenSSL-Win64/bin" _open_ssl_dir)
file (TO_CMAKE_PATH "$ENV{CUDA_PATH}/bin" _cuda_dir)

set (_dirs_to_search
  ${_open_ssl_dir}
  ${_cuda_dir}
)

foreach (_app_to_fixup IN LISTS _exe_files)
  message ("***** Fixing: [${_app_to_fixup}]")
  fixup_bundle ("${_app_to_fixup}" "${_dll_files}" "${_dirs_to_search}")
endforeach ()

