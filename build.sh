curl -O -L "https://bitbucket.org/almworks/sqlite4java/get/7b55b3eab690.zip"
unzip 7b55b3eab690.zip
mkdir -p src/main/java/com/almworks/sqlite4java
mkdir -p src/main/java/javolution/util/stripped
mkdir -p src/main/resources
mkdir -p src/test/java/com/almworks/sqlite4java
mkdir -p src/test/resources
mkdir native
mkdir -p swig/stub/com/almworks/sqlite4java
cp almworks-sqlite4java-7b55b3eab690/java/com/almworks/sqlite4java/*.java src/main/java/com/almworks/sqlite4java
cp almworks-sqlite4java-7b55b3eab690/java/javolution/util/stripped/*.java src/main/java/javolution/util/stripped
cp almworks-sqlite4java-7b55b3eab690/test/com/almworks/sqlite4java/*.java src/test/java/com/almworks/sqlite4java
cp almworks-sqlite4java-7b55b3eab690/swig/stub/com/almworks/sqlite4java/*.java src/main/java/com/almworks/sqlite4java
cp almworks-sqlite4java-7b55b3eab690/swig/*.i swig
cp almworks-sqlite4java-7b55b3eab690/swig/*.h swig
cp almworks-sqlite4java-7b55b3eab690/native/*.* native
swig -java -package com.almworks.sqlite4java -outdir swig/stub/com/almworks/sqlite4java -o swig/sqlite_wrap.c swig/sqlite.i
curl -O -L https://github.com/microsoft/vcpkg/archive/master.zip
unzip master.zip
cd vcpkg-master
./bootstrap-vcpkg.sh
./vcpkg install sqlite3
cd ..
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE="../vcpkg-master/scripts/buildsystems/vcpkg.cmake"
cmake --build . --target sqlite4java --config Release
strip libsqlite4java.so
mv libsqlite4java.so libsqlite4java-linux-amd64.so