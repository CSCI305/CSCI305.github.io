<center>

<h1>CSCI 305 Homework 4</h1>

<h3>Due Date: April 2, 2018 @ Beginning of Class</h3>
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

#### Memory Locations
1. Write the shortest ML function you can that would not work correctly if implemented using a dynamically allocated stack of activation records plus nesting links. Explain why it would fail.

```ml
fun f x =
  let
    fun g y = x + y
  in
    g
  end;
```

Fails since a dynamically allocated stack of activation records plus nesting links will not accommodate the return value of a function which requires the use of values from the containing function.
<br />
2. For the following ML function, could the activation record for the function be deallocated as soon as the function returns? Explain why or why not.

   ```ml
   fun f x = fn y => x + y;
   ```

   No as it returns a function which in turn uses the parameter to the original function as a variable.
<br />
3. The following ML function contains a function call that passes a function parameter `f`. Will the function `f` use its nesting link when called? Explain (Assume that the nesting link is *not* used to resolve references to predefined operators (like +) and functions (like `map`).)

   ```ml
   fun addall n theList =
     let fun f x = x + n;
     in map f theList
     end;
   ```

   Yes it does use its nesting link in order to find the value of the variable n.
