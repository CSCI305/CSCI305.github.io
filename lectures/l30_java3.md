# CSCI 305: Programming Languages

### Java Part 3

**Reading:** Webster Ch. 17

### Instructions
1. [Watch This Video](https://youtu.be/A-MeFOhVF_Q) - (26:44)
2. [Watch This Video](https://youtu.be/qiiCUO-XO5M) - (33:24)
3. [Watch This Video](https://youtu.be/ePk-sNF4VSs) - (08:14)
4. Review the [Lecture Slides](slides/Lecture30.pdf)
5. Review the Example Code
6. Complete the Out of Class Exercise
7. Check Your Learning
8. Attend Class and Complete the In Class Exercises
9. Check Your Learning
10. [Example Code](https://github.com/CSCI305/csci305-java-examples/tree/master/src/main/java/csci305/examples/java3)

### Out of Class Exercise
Work on Exercise 17.2 from the book (It's a bit too long to put here)

#### Check Your Learning:

##### Solution:

### In Class Exercises

#### Exercise 1
The behavior of the `try` statement in Java can be rather complicated, since the `try` block, the `catch` block, and the `finally` block can all finish their execution in different ways. For each of the following scenarios, what happens? Write simple test programs in Java to demonstrate the answers to the following questions about the behavior of `finally`. Include your program, its output, and your conclusions for each part.

1. The `try` block completes normally, and the `finally` block completes normally.
```java
        System.out.println("1");
        try {
            System.out.println("2");
        } catch (Exception e) {
            System.out.println("3");
        } finally {
            System.out.println("4");
        }
```
Output:
```
1
2
4
```

As expected the finally block executes.
<br/>
2. The `try` block stops by throwing an exception that is not caught, and the `finally` block stops by throwing a *different* exception.
```java
        System.out.println("1");
        try {
            System.out.println("2");
            throw new RuntimeException();
        } catch (NullPointerException e) {
            System.out.println("3");
        } finally {
            System.out.println("4");
            throw new ArithmeticException();
        }
```
Output:
```
1
2
4
Exception in thread "main" java.lang.ArithmeticException
	at TryCatchEx.main(TryCatchEx.java:12)
```

As expected the only exception propagated was the ArithmeticException.
<br/>
3. The `try` block stops by throwing an exception that is caught, the relevant catch block completes normally, and the `finally` block stops by throwing an exception.
```java
        System.out.println("1");
        try {
            System.out.println("2");
            throw new RuntimeException();
        } catch (RuntimeException e) {
            System.out.println("3");
        } finally {
            System.out.println("4");
            throw new ArithmeticException();
        }
```

Output:
```
1
2
3
4
Exception in thread "main" java.lang.ArithmeticException
	at TryCatchEx.main(TryCatchEx.java:12)
```

As expected the try, catch, and finally executed in order with the last line execute the ArithmeticException being thrown.
<br/>
4. The `try` block stops by throwing an exception that is caught, the relevant `catch` block stops by throwing a *different* exception, and the `finally` block stops by executing an explicit `return` statement.
```java
        System.out.println("1");
        try {
            System.out.println("2");
            throw new RuntimeException();
        } catch (RuntimeException e) {
            System.out.println("3");
            throw new IllegalArgumentException();
        } finally {
            System.out.println("4");
            return;
        }
```

Output:
```
1
2
3
4
```

<br/>
5. The `try` block stops by throwing an exception that is caught, the relevant `catch` block stops by executing an explicit `return` statement, and the `finally` block stops by executing an explicit `return` statement, returning a *different* value.
```java
        System.out.println("1");
        try {
            System.out.println("2");
            throw new RuntimeException();
        } catch (RuntimeException e) {
            System.out.println("3");
            return 0;
        } finally {
            System.out.println("4");
            return -1;
        }
```

Output:
```
1
2
3
4
-1
```

As expected the actual returned value was that returned from the finally block, as finally is always executed.
<br/>
6. The `try` block stops by executing an explicit `return` statement, and the `finally` block stops by throwing an exception.
```java
        System.out.println("1");
        try {
            System.out.println("2");
            return 0;
        } catch (RuntimeException e) {
            System.out.println("3");
            return 0;
        } finally {
            System.out.println("4");
            throw new ArithmeticException();
        }
```

Output:
```
1
2
4
Exception in thread "main" java.lang.ArithmeticException
	at TryCatchEx.x(TryCatchEx.java:17)
	at TryCatchEx.main(TryCatchEx.java:4)
```

As expected the last line execute was the throwing of the ArithmeticException and the two return statements were disregarded.
<br/>
