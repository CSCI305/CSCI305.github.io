<center>

<h1>CSCI 305 Homework 2</h1>

<h3>Due Date: February 23, 2018 @ Beginning of Class</h3>
<br />
<br />

<h4>Name:<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></h4>

</center>
<br />
<br />
<br />

#### Syntax and Semantics
1. Starting with the following BNF grammar:
   ```
   <exp> ::= <exp> + <mulexp> | <mulexp>
   <mulexp> ::= <mulexp> * <rootexp> | <rootexp>  |
   <rootexp> ::= ( <exp> )
             | a | b | c
   ```

   Construct an EBNF grammar from this grammar with the following modifications. Use the EBNF extensions wherever possible to simply the grammars. Include whatever notes to the reader required to make the associativity of the operators clear:

   a. Add subtraction and division operators (- and /) with the customary precedence and associativity.

   b. Then add a left-associative operator % between + and * in precedence.

   c. Then add a right-associative operator = at lower precedence than any of the other operators.

   **Complete Solution with Recursion**
   ```
   <exp> ::= <plusexp> [= <exp>]
   <plusexp> ::= [<plusexp> (+ | -)] <modexp>
   <modexp> ::= [<modexp> %] <mulexp>
   <mulexp> ::= [<mulexp> (/ | *)] <rootexp>
   <rootexp> ::= '(' <exp> ')' | a | b | c
   ```

   **OR Without Recursion**

   ```
   <exp> ::= {<plusexp> =} <plusexp>
   <plusexp> ::= <modexp> {(+ | -) <modexp>}
   <modexp> ::= <modexp> { % <mulexp>}
   <mulexp> ::= <rootexp> {(/ | *) <rootexp>}
   <rootexp> ::= '(' <exp> ')' | a | b | c

   {op <prod>} indicates left-associative
   {<prod> op} indicates right-associative
   ```

2. Show that the following grammar is ambiguous. (Note: To show that a grammar is ambiguous, you must demonstrate that it can generate two parse trees for the same string.)

   ```
     <person> ::= <woman> | <man>
     <woman> ::= wilma | betty | <empty>
     <man> ::= fred | barney | <empty>
   ```

   **Complete Solution**

   There are five possible strings that this grammar can generate: "wilma", "betty", "fred", "barney", and "". Only one of these leads to more one derivation: "". Thus the grammar is ambiguous. Thus, for the string "" (the empty string) we can generate the following two derivations:

   *Derivation 1:*
   ```
   <person> => <woman>
            => <empty>
            =>
   ```

   *Derivation 2:*
   ```
   <person> => <man>
            => <empty>
            =>
   ```

   Which lead to the following two parse trees:

   ```
        <person>              <person>
           |                     |
        <woman>                <man>
           |                     |
        <empty>               <empty>
           |                     |
          ""                     ""
   ```

3. For the grammar in Question 2, construct an unambiguous grammar for the same language.

   **Complete Solution**

   We can easily remove the ambiguity by shifting the `<empty>` terminal to the `<person>` rule and removing it from both the `<woman>` and `<man>` rules. It we look at this refined grammar below, we can then see that it still generates all five possible strings: "wilma", "betty", "fred", "barney", and "", but this time there is only one possible parse tree for each. Therefore, it is now unambiguous.
   ```
   <person> ::= <woman> | <man> | <empty>
   <woman> ::= wilma | betty
   <man> ::= fred | barney
   ```

#### Language Systems
1. Suppose the target assembly language for a compiler has these five instructions:

   ```
     push address
     add
     sub
     mul
     pop address
   ```

   In these instructions, and *address* is the name of a static variable (whose actual address will be filled in by the loader). The machine maintains a stack of integers, which can grow to any size. The `push` instruction pushes the integer from the given memory address to the top of the stack. The `add` instruction adds the top integer on the stack to the next-from-the-top integer, pops both off, and pushes the result onto the stack. The `sub` instruction subtracts the top integer on the stack from the next-from-the-top integer, pops both off, and pushes the result onto the stack. The `mul` instruction multiplies the top integer on the stack by the next-from-the-top integer, pops both off, and pushes the result onto the stack. The `pop` instruction pops an integer off the stack and stores it at the given memory address. So, for example, the compiler might translate the assignment `result := offset + (width * n)` into this:

   ```
      push offset
      push width
      push n
      mul
      add
      pop result
   ```

   Using this assembly language, give translations of the following assignment statements using as few instructions as possible:

   a. `net := gross - costs`

   b. `cube := (x * x) * x`

   c. `final := ((a - abase) * (b - bbase)) * (c - cbase)`


   **Complete Solution**

   `net := gross - costs`
   ```
     push gross
     push costs
     sub
     pop net
   ```

   `cube := (x * x) * x`
   ```
     push x
     push x
     push x
     mul
     mul
     pop cube
   ```

   `final := ((a - abase) * (b - bbase)) * (c - cbase)`
   ```
     push a
     push abase
     sub
     push b
     push bbase
     sub
     mul
     push c
     push cbase
     sub
     mul
     pop final
   ```

2. Investigate the `COMMON` keyword in Fortran. Describe how Fortran common blocks work and give an example. What happens if two named common blocks with the same name contain different variables? What is the difference between a blank common and a named common? What does the linker have to do to make this language construct work?
