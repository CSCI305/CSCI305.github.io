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

Although this code works, it is ugly and has two instances of the [`Switch Statements` Code Smell](https://sourcemaking.com/refactoring/smells/switch-statements). It is not written in a fully object-oriented style. It has no comments (another type of code smell). Your job is to replace it with a more beautiful implementation of the smae thing, using three separate classes for the three different behaviors of `FormattedInteger`. Your implementation must use a fully object-oriented style (eliminating the enumerations): "factor out" redundant code and variables into superclasses (aka [`Refactoring`](www.refactoring.com)), as necessary; provide polymorphism, using a new `FormattedInteger` as a common superclass or interface for the three classes; be generally beautiful, neat , and well commented; and still work.

#### Check Your Learning:

##### [Solution Video]() - (:)

##### Solution:

### In Class Exercises

#### Exercise 1

#### Check Your Learning:

##### [Solution Video]() - (:)

##### Solution:

#### Exercise 2

#### Check Your Learning:

##### [Solution Video]() - (:)

##### Solution:
