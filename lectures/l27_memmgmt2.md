# CSCI 305: Programming Languages

### Memory Management 2

**Reading:** Webster Ch. 14

### Instructions
1. [Watch This Video](https://youtu.be/zcVpiAc-jLs) - (47:35)
2. Review the [Lecture Slides](slides/Lecture26_27.pdf)
3. Complete the Out of Class Exercise
4. Check your learning
5. Attend Class and complete the In Class Exercises
6. Check your learning

### In Class Exercises

#### Exercise 1
Older language systems often managed one heap and one stack together in the same big block of memory. Embedded systems are sometimes still implemented this way. The heap lives at the low end of the block and the stack at the high end. The memory manager prevents them from running into each other, but does not use a fixed partition. A program can use a lot of stack space and a little heap, or a lot of heap space and a little stack, as it chooses.

Implement a `MemoryManager` class that combines the features of the `StackManager` and the `HeapManager` classes from the chapter. The following links contain the code code for the [`StackManager`](https://github.com/CSCI305/csci305-java-examples/blob/master/src/main/java/csci305/memmgmt/StackManager.java) and [`HeapManager`](https://github.com/CSCI305/csci305-java-examples/blob/master/src/main/java/csci305/memmgmt/HeapManager.java). Like them, it should have a constructor that takes as a parameter the meory array to be managed:

```java
public MemoryManager(int[] initialMemory)...
```

Like `StackManager` it should have methods to `push` and `pop` stack blocks:

```java
public int push(int requestSize)...
public void pop()...
```

Like `HeapManager` it should have methods to `allocate` and `deallocate` heap blocks:

```java
public int allocate(int requestSize)...
public void deallocate(int address)...
```

Your implementation should start with an empty stack and an empty heap. The heap should grow upwards only as necessary to satisfy allocation requests. Make sure to handle both ways of running out of memory cleanly. Don't let the stack run into the heap or the heap run into the stack. (when the `push` method finds that it is going to run into the heap, it could check whether the last block in the heap is free and, if so, remove it from the heap and use that space for the stack. But you do not have to implement this refinement. Your heap needs to be able to grow up toward the stack, but need never shrink.)


#### Check Your Learning:
