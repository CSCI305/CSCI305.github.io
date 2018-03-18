# CSCI 305: Programming Languages

### Java Part 1

**Reading:** Webster Ch. 13

### Instructions
1. [Watch This Video]() - (:)
2. Review the [Lecture Slides](slides/Lecture25.pdf)
3. Review the Example Code
4. Complete the Out of Class Exercise
5. Check Your Learning
6. Attend Class and Complete the In Class Exercises
7. Check Your Learning

### Out of Class Exercise
Using the following classes add the following components:

a. Add a `contains` instance method to the `IntList` class, so that `x.contains(b)` returns `true` if the `int` value `n` occurs in the `IntList x` and returns `false` otherwise.
b. Add an `equals` instance method to the `IntList` class, so that `x.equals(y)` returns `true` if the `IntList x` and the `IntList y` have exactly the same integers in the same order and returns `false` otherwise. It should be true that `x.equals(y)` is always equivalent to `y.equals(x)`. It should also be true that if `x==y` then `x.equals(y)`, although the reverse should not necessarily be true.
c. Add a `reverse` instance method to the `IntList` class, so that `x.reverse()` returns an `IntList` that is the reverse of the `IntList x`. There should be no side effect on `x`.

#### ConsCell.java
```java
/**
 * A ConsCell is an element in a linked list of ints
 */
public class ConsCell {
  private int head; // the first item in the list
  private ConsCell tail; // rest of the list or null

  /**
   * Construct a new ConsCell given its head and tail
   * @param h the int contents of this cell
   * @param t the next ConsCell in the list or null
   */
  public ConsCell(int h, ConsCell t) {
    head = h;
    tail = t;
  }

  /**
   * Accessor for the head of this ConsCell
   * @return the int contents of this ConsCell
   */
  public int getHead() {
    return head;
  }

  /**
   * Accessor for the tail of this ConsCell
   * @return the next ConsCell in the list or null
   */
  public ConsCell getTail() {
    return tail;
  }

  /**
   * Mutator for the tail of this ConsCell
   * @param t the new tail for this cell
   */
  public void setTail(ConsCell t) {
    tail = t;
  }
}
```

#### IntList.java
```java
/**
 * An IntList is a list of ints.
 */
public class IntList {
  private ConsCell start; // first in the list or null

  /**
   * Construct a new IntList given its first ConsCell
   * @param s the first ConsCell in the list or null
   */
  public IntList(ConsCell s) {
    start = s;
  }

  /**
   * Cons the given element h onto us and return the
   * resulting IntList.
   * @param h the head int for the new list.
   * @return the IntList with head h and us for a tail.
   */
  public IntList cons(int h) {
    return new IntList(new ConsCell(h, start));
  }

  /**
   * Get our length.
   * @return our int length
   */
  public int length() {
    int len = 0;
    ConsCell cell = start;
    while (cell != null) {
      len++;
      cell = cell.getTail();
    }
    return len;
  }

  /**
   * Print ourself to System.out
   */
  public void print() {
    System.out.print("[");
    ConsCell a = start;
    while (a != null) {
      System.out.print(a.getHead());
      a = a.getTail();
      if (a != null) System.out.print(",");
    }
    System.out.println("]");
  }
}
```

#### Driver.java
```java
public class Driver {
  public static void main(String[] args) {
    IntList a = new IntList(null);
    IntList b = a.cons(2);
    IntList c = b.cons(1);
    int x = a.length() + b.length() + c.length();
    a.print();
    b.print();
    c.print();
    System.out.println(x);
  }
}
```


#### Check Your Learning:

#### Modifications to IntList.java
```java
/**
 * An IntList is a list of ints.
 */
public class IntList {

  // everythin already in IntList

  public boolean contains(int n) {
    ConsCell x = start;
    while (x != null) {
      if (x.getHead() == n) return true;
      else x = x.getTail();
    }
    return false;
  }

  public boolean equals(IntList other) {
    ConsCell y = y.start;
    ConsCell x = start;

    if (this.length() != other.length())
      return false;

    while (x != null && y != null)
    {
      if (x.getHead() != y.getHead())
        return false;
      x = x.getTail();
      y = y.getTail();
    }

    return true;
  }

  public IntList reverse() {
    IntList rev = new IntList(null);
    ConsCell x = start;
    while (x != null) {
      rev.cons(x.getHead());
      x = x.getTail();
    }
    return rev;
  }
}
```

##### Solution:

### In Class Exercises

#### Exercise 1

Create a class `Int` with the following components:

a. A field to store an `int` value
b. A constructor so that new `Int(x)` creates an `Int` object that stores the `int` value `x`
c. An instance method `toString` so that `x.toString()` returns the value of `Int` object `x` in `String` form
d. An instance method `plus` so that `x.plus(y)` returns a new `Int` object whose value is the value of the `Int x` plus the value of the `Int y`. There should be no side effects.
e. Instance methods `minus`, `times`, and `div`, similar to `plus` method described above. (The `div` method should perform integer division, like the `/` operator on `int` values.)

#### Check Your Learning:

##### Solution:

#### Exercise 2

In this exercise you will create a class `IntSet` that represents a set of integers. There are many different ways to implement this, but for this exercise you should use a binary search tree (see Exercise 11 in Chapter 11) as the internal data structure for storing the set. The tree need not be balanced. In addition to the actual `IntSet` class, you will need to create an additional class or classes to represent nodes of the binary search tree. The `IntSet` class should have the following components:

a. A constructor so that `new IntSet()` creates an `IntSet` object that represents the empty set.
b. A `find` instance method so that `x.find(n)` returns `true` if `n` is an element of the `IntSet x` and returns `false` otherwise. (The `find` method should not search every node in the tree, but only those nodes that, according to the definition of a binary search tree, might contain `n`.)
c. An `add` instance method so that `x.add(n)` returns no value, but adds the integer `n` top the set `x`. If `n` is already present in `x`, `x` should not be changed.
d. A `toString()` instance method so that `x.toString()` returns a `String` representing the sorted contents of the set. For example, if `x` represents the set `{1,7,2,5}`, `x.toString()` should return `"{1,2,5,7}"`

#### Check Your Learning:

##### Solution:
