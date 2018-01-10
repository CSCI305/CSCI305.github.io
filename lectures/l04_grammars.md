# CSCI 305: Programming Languages

## Program Syntax

## Outside Class

**Reading:** Webster Ch. 2

[Watch this Video](https://youtu.be/hETZpdJcn7M)

## In Class
### Group Exercises:
#### Exercise 1:
Construct a BNF grammar for each of the following languages. As an example: a correct answer for "the set of all strings consisting of zero or more concatenated copies of the string `ab`" would be the following grammar:

```
<S> ::= ab <S> | <empty>
```
a. The set of all strings consisting of zero or more `a`'s

b. The set of all strings consisting of one or more digits. (Each digit is one of the characters 0 through 9)

c. The set of all string consisting of one or more `a`'s, with a comma between each `a` and the next. (There should be no comma before the first or after the last.)

d. The set of all strings consisting of an open bracket (the symbol `[`) followed by a list of zero or more digits separated by commas, followed by a closing bracket (the symbol `]`).

#### Exercise 2:
Construct an EBNF grammar for each of the above languages. Use EBNF extensions wherever possible to simplify the grammars. In particular, you should eliminate explicit recursion from the grammars wherever possible. Also, don't forget to put single quotes around any EBNF metasymbols when using them as a token.

#### Exercise 3:
Construct a syntax diagram for language `d.` above. Use branching and loops in your syntax diagram to make it as clear as possible.

#### Exercise 4:
Consider the following simple grammar for expressions:

```
<exp> ::= <exp> + <exp> | <exp> * <exp> | ( <exp> ) | a | b | c
```

Now suppose that the lexical structure of the language allows any number of spaces to occur anywhere in the expression. Give a BNF grammar that defines this explicitly, at the character level, using one grammar to capture both the phrase structure and the lexical structure. For example, your grammar should generate both `(a+b)` and `( a + b )`. Use a single-quoted space, `' '`, to indicate the space character in your grammar.
