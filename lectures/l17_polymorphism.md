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
Consider an unknown language with a left-associative `+` operator that is overloaded to have the following types: `int * real -> real`, `int * int -> int`, `real * int -> real`, and `real * real -> real`. Suppose the variable `i` has type `int` and the variable `r` has type `real`. For each `+` operator in each of the following expressions, say which type of `+` is used:

- `i + r`
- `i + (r + i)`

#### Check Your Learning:

##### Solution:
- `i + r`

In this case, the type of `+` operator is `int * real -> real`

- `i + (r + i)`

In this case, the second `+` operator, in `(r + i)`, is of type `real * int -> real` which then makes the first `+` operator of type `int * real -> real`.

#### Exercise 2
Write an ML function definition for each of the following functions. Try to predict what polytype ML will infer for each function. Then check your predictions using the ML language system. What is the polytype determined by ML for each case?

- `f(x) = 1`
- `f(x) = x`
- `f(g) = g(1)`
- `f(g, x, y) = g(x, y)`

#### Check Your Learning:

##### Solution:

- `f(x) = 1`
  ```ml
  fun f x = 1; (* Type: f = fn : 'a -> int *)
  ```

- `f(x) = x`
  ```ml
  fun f x = x; (* Type: f = fn : 'a -> 'a *)
  ```

- `f(g) = g(1)`
  ```ml
  fun f x = g(x); (* Type: f = fn : (int -> 'a) -> 'a *)
  ```

- `f(g, x, y) = g(x, y)`
  ```ml
  fun f (g, x, y) = g(x, y); (* Type: f = fn : ('a * 'b -> 'c) * 'a * 'b -> 'c *)
  ```

### In Class Exercises

#### Exercise 1
Consider an unknown language with integer and string types in which `1 + 2 * 3` evaluates to `7`, `"1" + "2" + "3"` evaluates to `"123"`, `"1" + 2 + 3` evaluates to `"123"`, and `1 + "2*3"` has a type error. Describe a system of precedence, associativity, overloading, and coercion that could account for this. In your system what is the result of evaluating the expression: `"1" + 2 * 3`?

#### Check Your Learning:

##### Solution:
Both the `+` and `*` operators are left-associative but the `*` operator has higher precedence than the `+` operator, when working with integers. When the left operand of the `+` operation is a string it has right-associativity. Furthermore, when the left operand of the `+` operator is a string the right operand is coerced into a string and the operation works as in string concatenation. When the left operand is an integer the operator attempts to perform addition and thus, if a string is the right operand, an error will occur as there is no guaranteed method of coercing a string into an integer. Finally, in this scheme, the evaluation of `"1" + 2 * 3` would evaluate to `"16"` as the `*` operator still has higher precedence than the `+` operator which would evaluate to an intermediate expression: `"1" + 6`, which then evaluates according to the string concatenation operation and coerces `6` to `"6"` leading to the final answer of `"16"`.

#### Exercise 2
Consider an unknown language with integer and real types in which `1 + 2`, `1.0 + 2`, `1 + 2.0`, and `1.0 + 2.0` are all legal expressions.

- Explain how this could be the result of coercion, using no overloading
- Explain how this could be the result of overloading, using no coercion
- Explain how this could be the result from subtype polymorphism, with no overloading or coercion

#### Check Your Learning:

##### Solution:

- Explain how this could be the result of coercion, using no overloading

  Similarly to the rules of Java whenever an addition expresion between to numerical types is considered and those types differe, then simply the least expressive type is coerce to the most expressive type. In this case regardless of the placement, if there is ever a real and and int in the expression the int is coerced to a real and the result is then a real. On the other hand, whenever the operands are of the same type, nothing happens.

- Explain how this could be the result of overloading, using no coercion

  We could consider the `+` operator as though it is a function which takes in two values. In this case, the function is overloaded with defintions for each possible combination: (int, int) -> int, (real, real) -> real, (int, real) -> real, and (real, int) -> real.

- Explain how this could be the result from subtype polymorphism, with no overloading or coercion

  In this case, we consider that the `+` operator is a method on the type Number, which is implemented in each of the SubTypes of number, in this case Integer and Real. Thus, the first operand is the SubType on which the operator is defined and it defines two forms of the `+` operator: `plusReal(real) -> real`, and `plusInt(int) -> Number`. The latter operation will return a real if called on the Real subtype, and an integer if called on the Integer subtype.
