#!/bin/sh

wget -N https://www.antlr.org/download/antlr-4.8-complete.jar
export CLASSPATH="./antlr-4.8-complete.jar:$CLASSPATH"
wget -N https://www.antlr.org/download/antlr4-cpp-runtime-4.8-source.zip
unzip antlr4-cpp-runtime-4.8-source.zip -d antlr-cpp-runtime
cd antlr-cpp-runtime
mkdir build
mkdir run
cd build
cmake .. -DANTLR_JAR_LOCATION=../../antlr-4.8-complete.jar
make
export DESTDIR=../run make install
cd ..
cd ..
java -jar antlr-4.8-complete.jar -Dlanguage=Cpp -no-listener -visitor -o mewlib
c++ -std=c++11 -I./antlr-cpp-runtime/runtime/src mewlib/mewmew*.cpp main.cpp ./antlr-cpp-runtime/dist/libantlr4-runtime.a -o mewmew

