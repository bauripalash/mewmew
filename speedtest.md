# MewMew Speed Test
## Using C++ chrono library
### For God's sake use, plain C. C is awesome. C++ is unnecessarily complex.
### Ditch ANTRL -> I don't like Java
### F java -> F C++

### Tests (in microseconds , average of five)

- Printing 1 to 100 numbers which are divisible by 2
    *   MewMew -> 11711 , 11802 , 11574 , 19901 , 12182
    *   C++    -> 266   , 226   , 261   , 234   , 228
    
    * **Averages**
        * MewMew -> 13344.0
        * C++    -> 243.0
    
    * **Result**
        * MewMew is about 54.913 times slower than C++
        

- Printing 1 to 100 numbers which are divisible by 3 and 5
    * MewMew -> 13972 , 24487 , 23980 , 23855 , 13878
    * C++    -> 72    , 55    , 69    , 58    , 70

    * **Averages**
        * MewMew -> 20034.4
        * C++    -> 64.8

    * **Result**
        * MewMew is about 309.173 times slower than C++
