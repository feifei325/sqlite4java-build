set curdir=%cd%
cd /D "%~dp0"

vcpkg install sqlite3:x86-windows-static

mkdir build-x86
cd build-x86

cmake .. -DCMAKE_BUILD_TYPE=Release -DVCPKG_TARGET_TRIPLET=x86-windows-static -G"Visual Studio 16 2019" -A Win32
cmake --build . --target sqlite4java --config Release
cmake -- build .

cd %curdir%