if (NOT DEFINED CMAKE_INSTALL_PREFIX)
  message (FATAL_ERROR "CMAKE_INSTALL_PREFIX not defined.")
endif ()

file (TO_CMAKE_PATH "${CMAKE_INSTALL_PREFIX}/bin" _dest_bin_dir)

file (GLOB_RECURSE _open_ssl_files "$ENV{ProgramFiles}/OpenSSL-Win64/bin/*.dll")

foreach (_file IN LISTS _open_ssl_files)
  message ("Copying [${_file}] to [${_dest_bin_dir}]")
  file (COPY "${_file}" DESTINATION "${_dest_bin_dir}")
endforeach ()

file (GLOB_RECURSE _cuda_files "$ENV{CUDA_PATH}/bin/*.dll")

foreach (_file IN LISTS _cuda_files)
  message ("Copying [${_file}] to [${_dest_bin_dir}]")
  file (COPY "${_file}" DESTINATION "${_dest_bin_dir}")
endforeach ()

