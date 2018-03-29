# CSCI 305: Programming Languages

### Java Part 2

**Reading:** Webster Ch. 15

### Instructions
1. [Watch This Video](https://youtu.be/jsw5yD_AgrI) - (52:30)
2. [Watch This Video](https://youtu.be/KR_4yrxNV0E) - (29:57)
3. Review the [Lecture Slides](slides/Lecture28.pdf)
4. Review the Example Code
5. Attend Class and Complete the In Class Exercises
6. Check Your Learning
7. [Example Code](https://github.com/CSCI305/csci305-java-examples/tree/master/src/main/java/csci305/examples/java2)

### In Class Exercises

#### Exercise 1

Using the following singularly typed list-based implementation of a String-String Dictionary. Transform it from the current singularly typed String-String Dictionary, to a generic Dictionary which can contain keys of any type linked to values of any type:

```java
public class AList {
  private ANode head = null;

  public String associate(String key, String value) {
    ANode n = nodeLookup(key);
    String oldValue;

    if (n != null) {
      oldValue = n.getValue();
      n.setValue(value);
    } else {
      n = new ANode(key, value, head);
      head = n;
      oldValue = null;
    }
    return oldValue;
  }

  public String find(String key) {
    ANode n = nodeLookup(key);
    return (n == null) ? null : n.getValue();
  }

  private ANode nodeLookup(String key) {
    ANode n = head;
    while (n != null && !n.getKey().equals(key)) {
      n = n.getLink();
    }

    return n;
  }

  public int size() {
    ANode n = head;
    int length = 0;

    while (n != null) {
      n = n.getLink();
      length++;
    }

    return length;
  }
}

public class ANode {
  private String key;
  private String value;
  private ANode link;

  public ANode(String k, String v, ANode li) {
    key = k;
    value = v;
    link = li;
  }

  public String getKey() {
    return key;
  }

  public String getValue() {
    return value;
  }

  public void setValue(String v) {
    value = v;
  }

  public void getLink() {
    return link;
  }
}
```

#### Check Your Learning:

##### Solution:

```java
class AList<K, V> {
    private ANode head = null;

    public V associate(K key, V value) {
        ANode<K, V> n = nodeLookup(key);
        V oldValue;

        if (n != null) {
            oldValue = n.getValue();
            n.setValue(value);
        } else {
            n = new ANode(key, value, head);
            head = n;
            oldValue = null;
        }
        return oldValue;
    }

    public V find(K key) {
        ANode<K, V> n = nodeLookup(key);
        return (n == null) ? null : n.getValue();
    }

    private ANode<K, V> nodeLookup(K key) {
        ANode<K, V> n = head;
        while (n != null && !n.getKey().equals(key)) {
            n = n.getLink();
        }

        return n;
    }

    public int size() {
        ANode<K, V> n = head;
        int length = 0;

        while (n != null) {
            n = n.getLink();
            length++;
        }

        return length;
    }

    public void test() {
        AList<String, Integer> list = new AList<>();
        list.associate("Hello", 1);

        ListIterator<K, V> iter = getIterator();
        while (iter.hasNext()) {
            K key = iter.next();
            this.find(key);
        }
    }

    public ListIterator<K, V> getIterator() {
        return new AListIterator<>(head);
    }
}

class ANode<K, V> {
    private K key;
    private V value;
    private ANode<K, V> link;

    public ANode(K k, V v, ANode<K, V> li) {
        key = k;
        value = v;
        link = li;
    }

    public K getKey() {
        return key;
    }

    public V getValue() {
        return value;
    }

    public void setValue(V v) {
        value = v;
    }

    public ANode<K, V> getLink() {
        return link;
    }
}
```

#### Exercise 2

Having solved the previous exercise we now will create an iterator for this data structure. Define an interface called `ListIterator` which defines the following interface.

* `next()` Which returns the next key or null if the current key is the last key.
* `hasNext()` Which returns true iff the next key is not null.

Once this is done, implement this interface in a class called `AListIterator` which will iterate across the contents of a `AList`. You should also create a method in `AList` named `getIterator()` which returns a new iterator starting at the `head` of the AList.

#### Check Your Learning:

##### Solution:
```java
interface ListIterator<K, V> {

    boolean hasNext();

    K next();
}

class AListIterator<K, V> implements ListIterator<K, V> {

    ANode<K, V> next;

    public AListIterator(ANode<K, V> node) {
        next = node;
    }

    @Override
    public boolean hasNext() {
        return next != null;
    }

    @Override
    public K next() {
        K key = next.getKey();
        next = next.getLink();
        return key;
    }
}
```
