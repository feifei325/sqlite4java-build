curl -O -L https://bitbucket.org/almworks/sqlite4java/get/7b55b3eab690.zip
7b55b3eab690.zip
jar xf 7b55b3eab690.zip
curl -O -L "https://sourceforge.net/projects/swig/files/swigwin/swigwin-3.0.12/swigwin-3.0.12.zip/download"
rename download swig.zip
jar xf swig.zip
mkdir src\main\java\com\almworks\sqlite4java
mkdir src\main\java\javolution\util\stripped
mkdir src\main\resources
mkdir src\test\java\com\almworks\sqlite4java
mkdir src\test\resources
mkdir native
mkdir swig\stub\com\almworks\sqlite4java
copy almworks-sqlite4java-7b55b3eab690\java\com\almworks\sqlite4java\*.java src\main\java\com\almworks\sqlite4java
copy almworks-sqlite4java-7b55b3eab690\java\javolution\util\stripped\*.java src\main\java\javolution\util\stripped
copy almworks-sqlite4java-7b55b3eab690\test\com\almworks\sqlite4java\*.java src\test\java\com\almworks\sqlite4java
copy almworks-sqlite4java-7b55b3eab690\swig\stub\com\almworks\sqlite4java\*.java src\main\java\com\almworks\sqlite4java
copy almworks-sqlite4java-7b55b3eab690\swig\*.i swig
copy almworks-sqlite4java-7b55b3eab690\swig\*.h swig
copy almworks-sqlite4java-7b55b3eab690\native native
swigwin-3.0.12\swig.exe -java -package com.almworks.sqlite4java -outdir swig\stub\com\almworks\sqlite4java -o swig\sqlite_wrap.c swig\sqlite.i
