<center>

<h1>CSCI 305 Homework 3</h1>

<h3>Due Date: March 9, 2018 @ Beginning of Class</h3>
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


#### Types
1. Give the ML type corresponding to each of the following sets:

    a. {true, false} **(1 point)**

    ```ml
    bool
    ```

    b. {(true, true), (true, false), (false, true), (false, false)} **(1 point)**
    ```ml
    bool * bool
    ```

2. Suppose there are three variables `X`, `Y`, and `Z` with these types:
   ```
   X: integer that is divisible by 3
   Y: integer that is divisible by 12
   Z: integer
   ```
   For each of the following assignments, knowing nothing about the values of the variables except their types, answer whether a language system can tell before running the program whether the assignment is safe? Why or why not?

     a. `X := Y` **(1 point)**

     Yes, as Y is a subset of X

     b. `Z := X` **(1 point)**

     Yes, as X is a subset of Z

     c. `X := X + 3` **(1 point)**

     Yes, as (X + 3) is still in set X

3. Investigate the following type: *Associative Arrays in Perl*. Describe your findings fully, and don't forget to discuss representation issues and supported operations. **(5 points)**

   Associative arrays in Perl are similar to Maps, Hashes, Dictionaries or Tables in other languages. They are key-value pairs, typically where the key is a string, and the value can be of any scalar value. Unlike other languages such as Java or Ruby, associative arrays are a built-in data structure in Perl. Furthermore, associative arrays have their own special syntax, starting with the variable names (which must begin with `%`). Associative arrays can be initialized as by providing comma separated key-value pairs contained within curly braces and assigned to a hash variable. Individual values can be accessed as scalars or arrays. For example:

   ```perl
   %table = { 'key1' => 1,
              'key2' => 2 }
   ```

   We can then access the values using the following syntax:

   ```perl
   $x = $table{'key1'}
   ```

   And we can add new key-value pairs as follows:

   ```perl
   $table{'key3'} = 3
   ```

   Finally, it should be noted that these the values may be of mixed scalar types.

   Some basic operations that can be applied to associative arrays are the following. To get all the keys, of x, we would use: `keys %x`. To get all the values, of x, we would use: `values %x`. To iterate across the key-value pairs (for example in a while loop) you can apply the `each` function, which returns two values (the key-value pair), as follows:

   ```perl
   while ( ($key, $value) = each(%x)) {
     # do something with $key and $value
   }
   ```

#### Polymorphism
1. Consider an unknown language with a left-associative `+` operator that is overloaded to have the following types: `int*real->real`, `int*int->int`, `real*int->real`, and `real*real->real`. Suppose the variable `i` has type `int` and the variable `r` has type `real`. For each `+` operator in each of the following expressions, say which type of `+` is used:

    a. `i + (r + i)` **(2 points)**

    ```
    (r + i): real * int -> real
    i + (): int * real -> real
    ```

    b. `i + i + r + (r + i)` **(4 points)**

    ```
    (r + i): real * int -> real
    i + i: int * int -> int
    i + r: int * real -> real
    r + (): real * real -> real
    ```

2. Consider an unknown language with integer and real types in which `1 + 2`, `1.0 + 2`, `1 + 2.0`, and `1.0 + 2.0` are all legal expression:

    a. Explain how this could be the result of overloading, using no coercion. **(2 points)**

    Simply, the + operator is defined through overloaded functions which take in two parameters of one of the following combination of types: (int, int), (real, int), (int, real), and (real, real)

    b. Explain how this could result from subtype polymorphism, with no overloading or coercion. **(2 points)**

    Simply, the Int and Real would need to be defined to have a common type such as Number. Then the + operator is defined to take two operands of type Number.
