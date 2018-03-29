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

Implement a `MemoryManager` class that combines the features of the `StackManager` and the `HeapManager` classes from the chapter. The following links contain the code code for the [`StackManager`](https://github.com/CSCI305/csci305-java-examples/blob/master/src/main/java/csci305/memmgmt/StackManager.java) and [`HeapManager`](https://github.com/CSCI305/csci305-java-examples/blob/master/src/main/java/csci305/memmgmt/HeapManager.java). Like them, it should have a constructor that takes as a parameter the memory array to be managed:

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

##### Solution:
```java
public class MemoryManager {

  static private final int NULL = -1; // our null link
  private int[] memory; // the memory we manager
  private int freeStart; // start of the free list
  private int top; // index of top (lowest) stack block

  public MemoryManager(int[] initialMemory) {
    memory = initialMemory;
    top = memory.length;
    memory[0] = memory.length; // one big free block
    memory[1] = top - 1; // free list ends with it
    freeStart = 0; // free list starts with it
  }

  /**
   * Allocate a block and return its address
   * @param requestSize int size of blcok, > 0
   * @return block address
   * @throws StackOverflowError if out of stack space
   */
  public int push(int requestSize) {
    int oldtop = top;
    top -= (requestSize + 1); // extra word for oldtop
    int lastFree = findLastFree();
    if (top < 0 || top - 1 > lastFree)
      throw new StackOverflowError();
    memory[top] = oldtop;
    memory[lastFree + 1] = top - 1;

    return top + 1;
  }

  private int findLastFree() {
    int p = freestart;
    while (p != NULL && memory[p + 1] < top - 1)
      p = memory[p + 1];

    return p;
  }

  /**
   * Pop the top stack frame. This works only if the
   * stack is not empty.
   */
  public void pop() {
    top = memory[top];
    memory[findLastFree() + 1] = top;
  }

  /**
   * Allocate a block and return its address
   * @param requestSize int size of block, > 0
   * @return block address
   * @throws OutOfMemoryError if no block big enough
   */
  public int allocate(int requestSize) {
    int size = requestSize + 1; // size including header

    // Do first-fit approach: linear search of the free
    // list for the first block of sufficient size

    int p = freeStart; // head of free list
    int lag = NULL;
    while (p != NULL && memory[p] < size) {
      lag = p; // lag is previous p
      p = memory[p + 1]; // link to next block
    }
    if (p == NULL || p > top - 1) // no block large enough
      throw new OutOfMemoryError();
    int nextFree = memory[p + 1]; // block after p

    // Now p is the index of a block of sufficient size
    // lag is the index of p's predecessor in the
    // free list, or NULL, and nextFree is the index of
    // p's successor in the free list, or NULL.
    // If the block has more space than we need, carve
    // out what we need from the front and return the
    // unused end part to the free list.

    int unused = memory[p]-size; // extra space in blcok
    if (unused > 1) { // if more than a header's worth
      nextFree = p + size; // index of the unused piece
      memory[nextFree] = unused; // fill in size
      memory[nextFree + 1] = memory[p + 1]; // fill in link
      memory[p] = size; // reduce p's size accordingly
    }

    // Link out the block we are allocating and done.

    if (lag == NULL) freeStart = nextFree;
    else memory[lag + 1] = nextFree;
    return p + 1; // index of useable word (after header)
  }

  /**
   * Deallocate an allocated blcok. This words only if
   * the block address is one that was returned by
   * allocate and has not yet been deallocated.
   * @param address int address of the block
   */
  public void deallocate(int address) {
    int addr = address - 1; // real start of the block

    // Find the insertion point in the sorted free list
    // for this block

    int p = freeStart;
    int lag = NULL;
    while (p != NULL && p < addr) {
      lag = p;
      p = memory[p + 1];
    }

    // Now p is the index of the block to come after
    // ours in the free list, or NULL, and lag is the
    // index of the block to come before ours in the
    // free list, or NULL.

    // If the one to come after ours is adjacent to it,
    // merge it into ours and restore the property
    // described above.

    if (addr + memory[addr] == p) {
      memory[addr] += memory[p]; // add its size to ours
      p = memory[p + 1];
    }

    if (lag == NULL) { // ours will be first free
      freeStart = addr;
      memory[addr + 1] = p;
    }
    else if (lag + memory[lag] == addr) { // block before is adjacent to ours
      memory[lag] += memory[addr]; // merge ours into it
      memory[lag + 1] = p;
    }
    else { // neither, just a simple insertion
      memory[lag + 1] = addr;
      memory[addr + 1] = p;
    }
  }
}
```
