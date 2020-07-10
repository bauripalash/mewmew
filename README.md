# /ᐠ｡ꞈ｡ᐟ\ MewMew Programming Language
### Program in Cats' Language

## Get Started
#### Integers
There's no concept of numbers (eg. 1 2 3 4 100) in MewMew, instead we use `mew`s. 1 `mew` is equal to 1 , therefor `mewmew` = 2 , `mewmewmew` = 3 , `mewmewmewmewmewmewmewmewmewmew` = 10. (You got the Idea right)

#### Print aka. *Meow Say*
There's no keyword , to print we use the `::` symbol, for example
`::mewmew + mewmew` outputs `4`

#### If
If statement of mewmew is very similar to ternary expression of C/C++.
`CONDITION ? TRUTH_BODY ;`

#### If Else
`CONDITION ? TRUTH_BODY : ELSE_BODY ;`

#### Repeat Loop aka. *Meow Loop*
`@TIMES : BODY ;`
Where `TIMES` can be any mew number , and the `BODY` will be executed `TIMES` times.


## Building Yourself
#### Required
- ANTLR4 JAR
- ANTLR4 (C++) RUNTIME
- GCC/G++
- CMake

#### How to Build
- Download & Setup ANTLR4 JAR (JAVA Runtime is Required to run ANTLR4)
- Download ANTLR4 C++ Runtime , compile and setup
- Fork , Clone this Repository
- `mkdir build && cd build`
- `cmake ..`
- If Things are good. You'll have a executable binary file called **mewmew**

