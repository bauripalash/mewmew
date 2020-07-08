.PHONY: all
all: grammar compile test

.PHONY: grammar
grammar:
	/usr/bin/java -jar /usr/local/lib/antlr-4.8-complete.jar -Dlanguage=Cpp -no-listener -visitor mewmew.g4 -o mewlib

.PHONY: compile
compile:
	g++ mewlib/mewmew*.cpp main.cpp -o mewmew -lantlr4-runtime

.PHONY: test
test:
	./mewmew example.txt

.PHONY: clean
clean:
	rm -rf mewlib
	rm mewmew


