file(TO_CMAKE_PATH "$ENV{HWLOC_ROOT}/bin" _hwloc_bin_dir)

add_custom_command(TARGET cornelius PRE_BUILD
  COMMAND "${CMAKE_COMMAND}" -E copy_directory
    "${_hwloc_bin_dir}"
    "${CMAKE_BINARY_DIR}/bin")

file(TO_CMAKE_PATH "$ENV{ProgramFiles}/OpenSSL-Win64/bin" _open_ssl_bin_dir)

add_custom_command(TARGET cornelius PRE_BUILD
  COMMAND "${CMAKE_COMMAND}" -E copy_directory
    "${_open_ssl_bin_dir}"
    "${CMAKE_BINARY_DIR}/bin")

file(TO_CMAKE_PATH "$ENV{CUDA_PATH}/bin" _cuda_bin_dir)

add_custom_command(TARGET cornelius PRE_BUILD
  COMMAND "${CMAKE_COMMAND}" -E copy_directory
    "${_cuda_bin_dir}"
    "${CMAKE_BINARY_DIR}/bin")

file(TO_CMAKE_PATH "$ENV{VS140COMNTOOLS}/../../VC/redist/x64/Microsoft.VC140.CRT" _vs140_dir)

add_custom_command(TARGET cornelius PRE_BUILD
  COMMAND "${CMAKE_COMMAND}" -E copy_directory
    "${_vs140_dir}"
    "${CMAKE_BINARY_DIR}/bin")
