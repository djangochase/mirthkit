#!/bin/sh
echo "Compiling object files"
g++ -Iciga -c ciga/acorn.cpp -o objects/acorn.o
g++ -Iciga -c ciga/albillo.cpp -o objects/albillo.o
g++ -Iciga -c ciga/amaryllis.cpp -o objects/amaryllis.o
g++ -Iciga -c ciga/amaryllis-gui.cpp -o objects/amaryllis-gui.o
g++ -Iciga -c ciga/argillite.cpp -o objects/argillite.o
g++ -Iciga -c ciga/abyss.cpp -o objects/abyss.o
g++ -Iciga -c ciga/CIGData.cpp -o objects/CIGData.o
g++ -Iciga -c ciga/MemoryBlock.cpp -o objects/MemoryBlock.o
g++ -Iciga -c main.cpp -o objects/main.o
windres icon.rc objects/icon.o
echo "Linking executable"
g++ -g -o MirthKit objects/acorn.o objects/albillo.o objects/amaryllis.o objects/amaryllis-gui.o \
objects/argillite.o objects/abyss.o objects/CIGData.o objects/MemoryBlock.o objects/main.o objects/icon.o \
-L/msys64/mingw64/lib/ -L/mingw64/lib/ -L/mingw64/x86_64-w64-mingw32/lib/ \
/mingw64/x86_64-w64-mingw32/lib/libmingw32.a \
/mingw64/lib/libcrypto.a \
-lSDLmain -lSDL -lSDL_ttf -lSDL_image -lSDL_mixer -lcurl -lopengl32 \
-lsquirrel -lsqstdlib -lws2_32 -lsqlite3 -lz
# -mwindows