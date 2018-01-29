# CSCI 305 Programming Languages

## Syntax and Semantics

**Reading:** Webster Ch. 3

## Outside The Classroom

### Instructions
1. [Watch This Video](https://youtu.be/K_uCkUBnBv0) - (26:15)
2. [Watch This Video](https://youtu.be/V40CWH9QLTo) - (10:44)
3. Complete the Out of class exercise
4. Review the [Lecture Slides](slides/Lecture07_08.pdf)

### Out of Class Exercise:
Given the following grammar:

```
<exp> ::= <exp> + <mulexp> | <mulexp>
<mulexp> ::= <mulexp> * <rootexp> | <rootexp>
<rootexp> ::= ( <exp> )
          | a | b | c
```

Modify it as follows:
- Add subtraction and division operators (- and /) with the customary precedence and associativity

#### Check Your Learning

##### [Solution Video](https://youtu.be/45GCFZcTpVU) - (02:46)

##### Solution
```
<exp> ::= <exp> + <mulexp> | <exp> - <mulexp> | <mulexp>
<mulexp> ::= <mulexp> * <rootexp> | <mulexp> / <rootexp> | <rootexp>
<rootexp> ::= ( <exp> )
          | a | b | c
```

### Group Exercises:

#### Exercise 1:
Given the following grammar:

```
<exp> ::= <exp> + <mulexp> | <mulexp>
<mulexp> ::= <mulexp> * <rootexp> | <rootexp>
<rootexp> ::= ( <exp> )
          | a | b | c
```

Modify it as follows:
- Add a left-associative operator % between + and * in precedence.
- Add a right-associative operator = at lower precedence than any of the other operators

#### Check Your Learning

##### [Solution Video](https://youtu.be/qsFfA6OnYLE) - (03:49)

##### Solution
```
<exp> ::= <addexp> = <exp> | <addexp>
<addexp> ::= <addexp> + <modexp> | <modexp>
<modexp> ::= <modexp> % <mulexp> | <mulexp>
<rootexp> ::= ( <exp> ) | a | b | c
```
