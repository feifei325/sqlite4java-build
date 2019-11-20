set curdir=%cd%
cd /D "%~dp0"

vcpkg install sqlite3:x64-windows-static

mkdir build-x64
cd build-x64

cmake .. -DCMAKE_TOOLCHAIN_FILE="C:/tools/vcpkg/scripts/buildsystems/vcpkg.cmake" -DCMAKE_BUILD_TYPE=Release -DVCPKG_TARGET_TRIPLET=x64-windows-static -G"Visual Studio 16 2019" -A x64
cmake --build . --target sqlite4java --config Release
cmake -- build .

cd %curdir%