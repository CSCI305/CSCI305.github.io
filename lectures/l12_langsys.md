# CSCI 305: Programming Languages

### Language Systems II

**Reading:** Webster Ch. 4

### Instructions
1. [Watch This Video](https://youtu.be/11FPzprkaoE) - (22:57)
2. [Watch This Video](https://youtu.be/B-dlSRCkdMY) - (33:19)
3. Review the [Lecture Slides](slides/Lecture10_12.pdf)
4. Complete the Out of Class Exercise
5. Check your learning
6. Attend Class and complete the In Class Exercises
7. Check your learning

### Out of Class Exercise

#### Exercise

What is the binding time for each of the following in a C or C++ program? State the binding time as precisely as possible (langugae-definition time, language-implementation time, compile time, link time, load time, or runtime).

* The location in memory of a global static variable.
* The code for the `printf` function
* The type of a local variable in a function.

#### Check Your Learning:

##### Solution:

* The location in memory of a global static variable => Load Time
* The code for the `printf` function => Compile Time
* The type of a local variable in a function => Compile Time

### In Class Exercises

#### Exercise

Suppose the target assembly language for a compiler has these five instructions for integers:

```
   load address,reg
   add reg,reg,reg
   sub reg,reg,reg
   mul reg,reg,reg
   store reg,address
```

In these instructions, and *address* is the name of a static variable (whose actual address will be filled in by the loader). A *reg* is the name of an integer register, a special extra-fast memory location inside the processor. The target assembly language has three integer registers: `r1, r2, ` and `r3`. The `load` instruction loads the integer from the given memory address into the given register. The `add` instruction adds the second register to the first register and places the result in the third register. The `sub` instruction subtracts the second register from the first register and places the result in the third register. The `mul` instruction multiplies the first register by the second register and places the result in the third register. The `store` instruction stores the integer from the given register at the given memory address. So, for example the compiler might translate the assignment `result := offset + (width * n)` into this:

```
   load width, r1
   load n,r2
   mul r1,r2,r1
   load offset,r2
   add r2,r1,r1
   store r1,result
```

Using this assembly language, give translations of the following assignment statements. Use as few instructions as possible:

* cube := (x * x) * x
* final := ((a - abase) * (b - bbase)) * (c - cbase)

#### Check Your Learning:

<!--
##### [Solution Video](https://youtu.be/buUvlIPm2_c) - (05:44)

##### Solution:

* `cube := (x * x) * x`

```
   load x, r1
   mul r1, r1, r2
   mul r2, r1, r1
   store r1, cube
```

* `final := ((a - abase) * (b - bbase)) * (c - cbase)`

```
   load a, r1
   load abase, r2
   sub r1, r2, r1
   load b, r2
   load bbase, r3
   sub r2, r3, r2
   mul r1, r2, r1
   load c, r2
   load cbase, r3
   sub r2, r3, r2
   mul r1, r2, r1
   store r1, final
```
-->
