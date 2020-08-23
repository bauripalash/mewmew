---
title: "MewMew : Programming in Cats' Language"
tags:
    - Programming language
    - c++
    - ANTLR
    - cat
authors:
    - name : Palash Bauri
      orcid: 0000-0002-0498-628X
      affiliation: 1
affiliations:
    - name: Independent Researcher
      index: 1
date: 23 August 2020
bibliography: paper.bib
---

# Abstract

Computer Programming can be hard , can be complex to understand for some people, but that doesn’t mean that they can’t be fun. From the beginning , programming languages were in English , well most of them except some special languages. But I have designed a programming language which let’s people program in Cats’ language, Mew Mew Mew. Which despite being a esoteric language is very much usable , and let’s programmers create complex program. I 
also have conducted a small study to find real world use cases of MewMew programming language.

# 1. Introduction
Programming in Cats’ language , it is lunacy or what? But it’s reality. With MewMew one can program in cats’ language, but it is not actually the cats’ language but the human interpretation of cats’ language , mew mew mew.
MewMew is an esoteric programming language built with ANTLR4 and C++. It is not intended to be used for commercial or mainstream programming instead , it was designed to be learning project for me or any other novice language designer who want get started building their own programming language.
While majority of programming languages are in English or I should say human languages but this language intends to be one of the first language to be in ‘non-human’ (not technically) language.

# 2. MewMew Language
MewMew is implemented using ANTLR4 and C++. Though using Dynamically typed host language would be given me more flexibilty designing the language, I chose to use a statically typed for a multiple reasons , First it is fast. Second , the language becomes much more runtime safe. When experimenting with early prototypes , I tried Python and PLY (Python Lex and Yacc) , Tatsu and even Flex & Bison. Python and PLY was not chosen because it was too much slow , even Cythonzing didn’t give advantage. Tatsu was kind of better than PLY but again speed issue, and Flex & Bison , I didn’t chose them because of their over complexity , a language small as MewMew required a huge codebase. Finally I setteled for ANTLR4 , It was comparativaly fast thanks to its ALL(*) algorithm , on top of that the API of it was very easy to catch on but also very robust.
When Designing MewMew , I left some places which can be used to improve or extend the language in future.

MewMew doesn’t use any traditional numbers (0 to 9) instead it uses ‘mew’s. For example , ‘mew’ will get converted to 1 , ‘mewmew’ will get converted to 2  , ‘mewmewmewmewmewmewmewmewmewmew’ will get converted to 10 and so on so forth but zero has special case , to get only zero one can use ‘mew-mew’. 
MewMew also has few operator similar to C++, which are discussed in GitHub project repository README. MewMew is all about numbers, it doesn’t contain any other types such as strings , chars , arrays etc , which keeps the language lightweight. Every number in mewmew is a floating point number.
MewMew also has if , if else and a repeat loop aka. Meow loop expression. It also has a special type of function called scratch function which open the door of extending the language in future. Syntax of if statement is something like Expression ? Statements ; where ‘Expression’ takes any type of expression , on Truthy value the ‘Statements’ will get executed. Similar to that Expression ? Statements1 : Statements2 ; is the syntax of if-else statement, if the value of ‘Expression’ is truthy the ‘Statements1’ will get executed else ‘Statement2’ will get executed. The syntax of meow loop is something like this @ Expression : Statements; the ‘Statements’ will get executed N times where N = Expression. Scratch function syntax is something like #(Expression) where ‘#’ can be repeated from 1 to many times. But as of 5 functions are defined only.

Here’s a comparison of some simple program written in MewMew and C++ : 

| In MewMew | In C++ |
| --------- | ------ |
| m=mew;<br>@#####(mew):<br>m % mewmew == mew – mew ?<br>::m;<br>;<br>m = m + mew;<br>;<br> | #include <iostream><br>using namespace std;<br><br>int main()<br>{<br>for(int m = 1; m <= 100 ; ++m){<br>if (m%2 == 0){<br>cout << m << endl;<br>}<br>}<br>}<br> |
| m=mew;<br>@####(mew):<br>m % mewmewmew == mew – mew & m % ###(mew) == mew – mew ? <br>::m;<br>;<br>m = m + mew;<br>;<br> | #include <iostream><br>using namespace std;<br><br>int main()<br>{<br>for(int m = 1; m <= 100 ; ++m){<br>if (m%3 == 0 && m%5==0){<br>cout << m << endl;<br>}<br>}<br>}<br>|

# 3. Conclusion and Future Work
MewMew is an esoteric language which is morelike a joke than a commercial language. It was created to be a leaning project for which it has done successfully. In future it also might work as an reference to learning language designing for future.With the scratch function it opens new doors forexpanding the language in future. It will only took a few lines of code in switch...case statement to add a new function.

# 4. References
1. Wikipedia contributors. "Esoteric programming language." Wikipedia, TheFree Encyclopedia. Wikipedia, The Free Encyclopedia, 8 Mar. 2020. Web. 11 Jul. 2020. 

2. Parr, Terence. (2013). The Definitive ANTLR 4 Reference. ISBN: 978-1-93435-699-9

3. Schildt, Herbert. C++: The Complete Reference, 4th Edition. ISBN: 978-0070532465