@echo off

set _dep_dir=X:\Google Drive\Encrypted\3rdparty\msvc2017_64\v141\xmr-stak-dep
set HWLOC_ROOT=%_dep_dir%\hwloc
set MICROHTTPD_ROOT=%_dep_dir%\libmicrohttpd

set CMAKE
set HWLOC
set MICROHTTPD

set _src_dir=.
set _bld_dir="..\..\bld\xmr-stak"
mkdir "%_bld_dir%"

cmake -G "Visual Studio 15 2017 Win64" -T v141,host=x64 ^
  -D "CMAKE_INSTALL_PREFIX:PATH=\cmake-install-prefix\xmr-stak\1.0.4-rx" ^
  -S "%_src_dir%" ^
  -B "%_bld_dir%"

