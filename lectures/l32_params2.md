# CSCI 305: Programming Languages

### Parameters Part 2

**Reading:** Webster Ch. 18

### Instructions
1. [Watch This Video](https://youtu.be/vyh0qWaHgPg) - (09:38)
2. [Watch This Video](https://youtu.be/Wn7oikcszfI) - (31:47)
3. [Watch This Video](https://youtu.be/7Qsh1TWbS08) - (06:40)
3. Review the [Lecture Slides](slides/Lecture31_32.pdf)
4. Complete the Out of Class Exercise
5. Check your learning
6. Attend Class and complete the In Class Exercises
7. Check your learning

### Out of Class Exercise

#### Exercise
One important question about by-result parameter passing that was not mentioned is this: when does the language system compute the lvalue of the actural parameter? (The lvalue of the actual parameter is the memory location to which the final value of the formal parameter is written.) You might have assumed that this would be computed, like a by-reference parameter, before the called method executes. But since it is not neeeded until the called method returns, its computation could be delayed until it is needed, like a by-name parameter. Ada does it the early way, while Algol W does it at the last minute.

Here is an example that illustrates the difference:
```java
void f(int[] A) {
  int i = 0;
  g(i, A[i])
}
```

```java
void g(by-reference int i, by-result int j) {

}
```

For each of these two different interpretations of by-result parameter passing, explain what happens when `f` calls `g`. In particular, say exactly what happpens when any change is made to `i` or `A`.

#### Check Your Learning:

##### Solution:

### In Class Exercises

#### Exercise 1
An important detail of by-result and value-result parameter passing is the *order* in which the final values of the formal parameters are written back to the actual parameters. A method `f(a, b)` might write back first `a` then `b`, or first `b` then `a`. Or the language specification might leave the order unspecified, leaving it up to the language system. The order can make a significant difference.

Write two Java-like methods `f` and `g` that illustrate this distinction. Your method `f` should call only `g`, passing parameters by value-result. Your `g` method should make no calls. Your methods should produce different results (that is, different final values in the variables of `f`) depending on the order in which the value-result parameters of `g` are written back. Explain the results that two different write-back orders would produce for your example.

#### Check Your Learning:

##### Solution:

#### Exercise 2
Make an experiment with the ML language system that demonstrates that ML does not pass parameters by name. Show the results of your experiment, and explain what results by-name parameter passing would have given.

#### Check Your Learning:

##### Solution:

#### Exercise 3
Make an experiment with the ML language system that demonstrates that ML does not recopy lists when they are passed as parameters. (*Hint:* The only way to tell the difference, without side effects, is by timing.) Show the results of your experiment, and explain what results you would expect if ML recopied list parameters.

#### Check Your Learning:

##### Solution:
