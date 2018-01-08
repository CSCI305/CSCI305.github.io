# CSCI 305 Programming Languages

## Syntax and Semantics

**Reading:** Webster Ch. 3

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
- Add subtraction and division operators (- and /) with the customary precedence and associativity
- Add a left-associative operator % between + and * in precedence.
- Add a right-associative operator = at lower precedence than any of the other operators

#### Exercise 2
Show that the following grammar is ambiguous. (To show this, you must demonstrate that it can generate two parse trees for the same string).

```
<exp> ::= <exp> + <exp>
      | <exp> * <exp>
      | ( <exp> )
      | a | b | c
```

#### Exercise 3
Redefine the grammar in Exercise 2 to be unambiguous.
