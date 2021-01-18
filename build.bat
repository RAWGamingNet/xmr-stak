@echo off

set _bld_dir="..\..\bld\xmr-stak"

cmake --build "%_bld_dir%" --target ALL_BUILD --config Release
cmake --build "%_bld_dir%" --target fixup_bundle --config Release

