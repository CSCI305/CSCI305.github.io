# CSCI 305: Programming Languages

### Polymorphism

**Reading:** Webster Ch. 8

### Instructions
1. [Watch This Video](https://youtu.be/bhGv4Nww5aA) - (10:30)
2. [Watch This Video](https://youtu.be/ft7Ru2CAgKA) - (10:46)
3. [Watch This Video](https://youtu.be/etqtyBRuqA4) - (06:54)
2. Review the [Lecture Slides](slides/Lecture17.pdf)
3. Complete the Out of Class Exercise
4. Check your learning
5. Attend Class and complete the In Class Exercises
6. Check your learning

### Out of Class Exercise

#### Exercise 1
Consider an unknown language with a left-associative `+` operator that is overloaded to have the following types: `int * real -> real`, `int * int -> int`, `real * int -> real`, and `real * real -> real`. Suppose the variable `i` has type `int` and the variable `r` has type `real`. For each `+` opeartor in each of the following expressions, say which type of `+` is used:

- `i + r`
- `i + (r + i)`

#### Exercise 2
Write an ML function definition for each of the following functions. Try to predict what polytype ML will infer for each function. Then check your predictions using the ML language system. What is the polytype determined by ML for each case?

- `f(x) = 1`
- `f(x) = x`
- `f(g) = g(1)`
- `f(g, x, y) = g(x, y)`

#### Check Your Learning:

##### Solution:

### In Class Exercises

#### Exercise 1
Consider an unknown language with integer and string types in which `1 + 2 * 3` evaluates to `7`, `"1" + "2" + "3"` evaluates to `"123"`, `"1" + 2 + 3` evaluates to `"123"`, and `1 + "2*3"` has a type error. Describe a system of precedence, associativity, overloading, and coercison that could account for this. In your system what is the result of evaluating the expression: `"1" + 2 * 3`?

#### Check Your Learning:

##### Solution:

#### Exercise 2
Consider an unknown language with integer and real types in which `1+2`, `1.0+2`, `1+2.0`, and `1.0+2.0` are all legal expressions.

- Explain how this could be the result of coercion, using no overloading
- Explain how this could be the result of overloading, using no coercion
- Explain how this could be the result from subtype polymorphism, with no overloading or coercion

#### Check Your Learning:

##### Solution:
