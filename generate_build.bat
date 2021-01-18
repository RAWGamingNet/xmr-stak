@echo off

set _comp=msvc2017
set _arch=x64
set _crt=v141

set _sw_root=X:\Google Drive\Encrypted\Software
set _dep_dir=%_sw_root%\xmr-stak-dep\v3\%_comp%_%_arch%\%_crt%
set HWLOC_ROOT=%_dep_dir%\hwloc
set MICROHTTPD_ROOT=%_dep_dir%\libmicrohttpd

set _src_dir=.
set _bld_dir="..\..\bld\xmr-stak"
mkdir "%_bld_dir%"
del "%_bld_dir%/CMakeCache.txt"

cmake -G "Visual Studio 15 2017 Win64" -T %_crt%,host=%_arch% ^
  -D "CMAKE_INSTALL_PREFIX:PATH=%_sw_root%\xmr-stak\1.0.4-rx\%_comp%_%_arch%\%_crt%" ^
  -D "XMR_STAK_DEP_ROOT:PATH=%_dep_dir%" ^
  -S "%_src_dir%" ^
  -B "%_bld_dir%"

