.PHONY: all
all: grammar compile test

.PHONY: grammar
grammar:
	/usr/bin/java -jar /usr/local/lib/antlr-4.8-complete.jar -Dlanguage=Cpp -no-listener -visitor mewmew.g4 -o mewlib

.PHONY: compile
compile:
	c++ -std=c++11 mewlib/mewmew*.cpp main.cpp -o mewmew -lantlr4-runtime

.PHONY: test
test:
	./test.sh

.PHONY: build
build:
	./build.sh

.PHONY: clean
clean:
	rm -rf mewlib
	rm mewmew


