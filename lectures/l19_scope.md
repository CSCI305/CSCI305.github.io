# CSCI 305: Programming Languages

### Scope Part I

**Reading:** Webster Ch. 10

### Instructions
1. [Watch This Video](https://youtu.be/wHHHGuETLX0) - (11:21)
2. [Watch This Video](https://youtu.be/j1Zvt2S0ZUo) - (15:02)
3. [Watch This Video](https://youtu.be/jupr2rD9vwQ) - (16:47)
4. Review the [Lecture Slides](slides/Lecture19_21.pdf)
5. Complete the Out of Class Exercise
6. Check your learning
7. Attend Class and complete the In Class Exercises
8. Check your learning

### Out of Class Exercise
Here is the example used to show primitive namespaces in Java:
```java
class Reuse {
    Reuse Reuse(Reuse Reuse) {
        Reuse:
           for (;;) {
               if (Reuse.Reuse(Reuse) == Reuse)
                  break Reuse;
           }
           return Reuse;
    }
}
```
Copy it and then annotate it as follows:

- For each occurrence of the name `Reuse` that is a definition, describe what binding for `Reuse` is established
- For each occurrence of `Reuse` that is not a definition, show which definition is used to bind it.

#### Check Your Learning:

##### Solution:
Definition      | Binding
--------------- | -------
class Reuse     | Binding for the type Reuse
method Reuse()  | Binding for the method Reuse of type Reuse -> Reuse
parameter Reuse | Binding for the parameter Reuse of type Reuse in the Method Reuse
label Reuse:    | Binding for the labelled block Reuse

Use of Reuse | Binding Used
------------ | ------------
Reuse.Reuse  | bound to the method Reuse in the Class Reuse
(Reuse)      | bound to the parameter Reuse of the method Reuse in the class Reuse
== Reuse     | bound to the parameter Reuse of the method Reuse in the class Reuse
break Reuse  | bound to the Label Reuse
return Reuse | bound to the parameter Reuse of the method Reuse in the class Reuse

### In Class Exercises

#### Exercise
Here is the example used to show the difference between scoping with blocks and dynamic scoping:
```ml
fun g x =
   let
      val inc = 1;
      fun f y = y + inc;
      fun h z =
        let
          val inc = 2;
        in
          f z
        end;
   in
      h x
   end;
```
Copy it and then annotate it as follows:
- Draw a circle around every block, and number the blocks.
- Identify each definition of a name.
- For each definition, describe its cope in terms of your block numbers
- For each occurrence of a name (other than a definition of that name), show which definition is used to bind it. Check that this agrees with your scopes.

#### Check Your Learning:

##### Solution:
