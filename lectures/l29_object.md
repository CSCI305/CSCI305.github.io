# CSCI 305: Programming Languages

### Object Orientation

**Reading:** Webster Ch. 16

### Instructions
1. [Watch This Video](https://youtu.be/HHd-Ghgk9Jw) - (20:54)
2. [Watch This Video](https://youtu.be/uvMEcJTTIX8) - (27:54)
3. Review the [Lecture Slides](slides/Lecture29.pdf)
4. Complete the Out of Class Exercise
5. Check your learning
6. Attend Class and complete the In Class Exercises
7. Check your learning

### Out of Class Exercise

#### Exercise
The following Java class, `FormattedInteger`, stores a single integer value. It has the methods `getInt` and `setInt` to get and set the stored value. It also has the methods `getString` and `setString`, which allow a client to get and set the stored value using a string representation. The class handles three different string representations: ordinary signed decimal integers, such as "-2"; hex integers starting with "0x", such as "0xfffffffe"; and octal integers starting with "0", such as "037777777776". (All three of these examples are string representations for the same number.) The class uses an enumeration to encode which of the three formats it will understand. The `setString` method is the only slightly complicated one. It checks the string to make sure it has the appropriate format and returns an error message if there is any problem. Here is the code for this class:

```java
public class FormattedInteger {
  public static final int HEX = 0;
  public static final int PLAIN = 1;
  public static final int OCTAL = 2;
  private int value;
  private int format;

  public FormattedInteger(int format) {
    this.format = format;
  }

  public int getInt() {
    return value;
  }

  public String getString() {
    String result = null;
    switch (format) {
      case HEX:
        result = "0x" + Integer.toHexString(value);
        break;
      case OCTAL:
        result = "0" + Integer.toOctalString(value);
        break;
      default
        result = Integer.toString(value);
        break;
    }
    return result;
  }

  public void setInt(int value) {
    this.value = value;
  }

  public String setString(String s) {
    switch (format) {
      case HEX:
        if (!s.startsWith("0x"))
          return "Hex strings must start with \"0x\".";
        int i = 2;
        while (i < s.length()) {
          char c = s.charAt(i);
          if (!(('0' <= c && c <= '9') ||
                ('a' <= c && c <= 'f') ||
                ('A' <= c && c <= 'F')))
            return "Hex digits are 0..9 and A..F (or a..f).";
          i++;
        }
        value = (int) Long.parseLong(s.substring(2), 16);
        break;
      case OCTAL:
        if (s.charAt(0) != '0')
          return "Octal requires a leading zero.";
        int i = 0;
        while (i < s.length()) {
          char c = s.charAt(i);
          if (!('0' <= c && c <= '7'))
            return "Octal digits must be 0..7";
          i++;
        }
        value = (int) Long.parseLong(s, 8);
        break;
      default:
        boolean negative = false;
        if (s.charAt(0) == '-') {
          negative = true;
          s = s.substring(1);
        }
        else if (s.charAt(0) < '0' || s.charAt(0) > '9')
          return "First char must be a decimal digit or a minus sign.";
        int i = 0;
        while (i < s.length()) {
          char c = s.charAt(i);
          if (!('0' <= c && c <= '9'))
            return "Decimal digits must be 0..9";
          i++;
        }
        value = Integer.parseInt(s);
        if (negative) value = -value;
    }
    return "";
  }
}
```

Although this code works, it is ugly and has two instances of the [`Switch Statements` Code Smell](https://sourcemaking.com/refactoring/smells/switch-statements). It is not written in a fully object-oriented style. It has no comments (another type of code smell). Your job is to replace it with a more beautiful implementation of the same thing, using three separate classes for the three different behaviors of `FormattedInteger`. Your implementation must use a fully object-oriented style (eliminating the enumerations): "factor out" redundant code and variables into superclasses (aka [`Refactoring`](www.refactoring.com)), as necessary; provide polymorphism, using a new `FormattedInteger` as a common superclass or interface for the three classes; be generally beautiful, neat , and well commented; and still work.

#### Check Your Learning:

##### Solution:
```java
public abstract class FormattedInteger {
  private int value;
  private int format;

  public FormattedInteger() {
  }

  public int getInt() {
    return value;
  }

  public abstract String getString();

  public void setInt(int value) {
    this.value = value;
  }

  public abstract void setString(String s);
}

public class HexFormattedInteger extends FormattedInteger {

  public HexFormattedInteger() {}

  @Override
  public String getString() {
    return "0x" + Integer.toHexString(value);
  }

  @Override
  public void setString(String s) {
    if (!s.startsWith("0x"))
      throw new IllegarArgumentException("Hex strings must start with \"0x\".");
    int i = 2;
    while (i < s.length()) {
      char c = s.charAt(i);
      if (!(('0' <= c && c <= '9') ||
            ('a' <= c && c <= 'f') ||
            ('A' <= c && c <= 'F')))
        throw new IllegalArgumentException("Hex digits are 0..9 and A..F (or a..f).");
      i++;
    }
    value = (int) Long.parseLong(s.substring(2), 16);
  }
}

public class OctalFormattedInteger extends FormattedInteger {

  public OctalFormattedInteger() {}

  @Override
  public String getString() {
    return "0" + Integer.toOctalString(value);
  }

  @Override
  public void setString(String s) {
    if (s.charAt(0) != '0')
      throw new IllegalArgumentException("Octal requires a leading zero.");
    int i = 0;
    while (i < s.length()) {
      char c = s.charAt(i);
      if (!('0' <= c && c <= '7'))
        throw new IllegalArgumentException("Octal digits must be 0..7");
      i++;
    }
    value = (int) Long.parseLong(s, 8);
  }
}

public class DecimalFormattedInteger extends FormattedInteger {
  public DecimalFormattedInteger() {}

  @Override
  public String getString() {
    return Integer.toString(value);
  }

  @Override
  public void setString(String s) {
    boolean negative = false;
    if (s.charAt(0) == '-') {
      negative = true;
      s = s.substring(1);
    }
    else if (s.charAt(0) < '0' || s.charAt(0) > '9')
      throw new IllegalArgumentException("First char must be a decimal digit or a minus sign.");
    int i = 0;
    while (i < s.length()) {
      char c = s.charAt(i);
      if (!('0' <= c && c <= '9'))
        throw new IllegalArgumentException("Decimal digits must be 0..9");
      i++;
    }
    value = Integer.parseInt(s);
    if (negative) value = -value;
  }
}
```


### In Class Exercises

#### Exercise 1
Suppose two reference variables `x` and `y` have the declared types `R` and `S` like this:

```java
     R x;
     S y;
```

When the types guarantee that this is safe (i.e., when `S` is a subtype of `R`), Java will allow the assignment `x = y`. When neither of these conditions holds, the assignment might or might not be possible at runtime, and Java will permit it only with an explicit type case, `x = (R) y`. (This kind of type cast is called a *downcast*) With this explicit type cast, the Java language system performs a runtime check to make sure the exact class of y at runtime is in the type `R`.

Suppose the following Java declarations:

```java
   class C1 implements I1 {
   }
   class C2 extends C1 implements I2 {
   }
   class C3 implements I1 {
   }
```

where `I1` and `I2` are two unrelated interfaces neither extending the other, and suppose a variable of each type:

```java
   C1 c1;
   C2 c2;
   C3 c3;
   I1 i1;
   I2 i2;
```

For each possible assignment of one of these five variables to another, say whether Java allows it, disallows it, or allows it only with a downcast, and explain why. (*Hint:* An assignment of `c1` to `i2` is allowed with a downcast, even though the class `C1` clearly does not implement interface `I2`. Think carefully about why.)

#### Check Your Learning:

##### Solution:

Assignment | Possible | Reason
---------- | -------- | ------
c1 = c2    | Allowed | c2 is-a C1 through inheritance
c1 = c3    | Disallowed |
c1 = i1    | Allowed With Downcast |
c1 = i2    | Disallowed |
c2 = c1    | Allowed with Downcast | c1 can be downcast to a C2
c2 = c3    | Disallowed |
c2 = i1    | Allowed with Downcast | i1 can be cast to a C1 which can be downcast to a C2
c2 = i2    | Allowed with Downcast |
c3 = c1    | Disallowed |
c3 = c2    | Disallowed |
c3 = i1    | Allowed with Downcast | i1 can be downcast to a C3
c3 = i2    | Disallowed |
i1 = c1    | Allowed | c1 is-a I1
i1 = c2    | Disallowed |
i1 = c3    | Allowed | c3 is-a I1
i1 = i2    | Allowed with Downcast | i2 can be downcast to a C2 which is-a I1 via inheritance from C1
i2 = c1    | Allowed with Downcast | c1 can be downcast to C2 which is-a I2
i2 = c2    | Allowed | c2 is-a I2
i2 = c3    | Disallowed |
i2 = i1    | Allowed with downcast | i1 can be downcast to C2 which is-a I2

#### Exercise 2
Suppose a derived class `C2` defines a method `m` of type `A2->B2` that overrides a method `m` of type `A1->B1`, inherited from the base class `C1`. Different languages have very different rules about how the types `A1` and `A2`, and `B1` and `B2`, must be related. Investigate and report on this aspect of inheritance, citing the sources you used. Answer the following questions:

 * Explain how this works in Java
 * What is the rule called *covariance*? Give an example of a language that uses the covariant rule. Explain the advantage of this rule.
 * What is the rule called *contravariance*? Give an example of a language that uses the contravariant rule. Explain the advantage of this rule.

#### Check Your Learning:

##### Solution:

* In Java, A1 must be equal to A2 or a subtype thereof, this also applies to B2.
* *Covariance* - In covariance a typing rule must preserve the order of types such that a type can be replaced by itself of a subtype. Java covariance type rules for both method overriding and array types.
* *Contravariance* - In contravariance a typing rule must preserve the order of types such that a type can be replaced by itself or a supertype. C# uses contravariance in its generic type type parameters.
