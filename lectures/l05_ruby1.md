# CSCI 305 Programming Languages

## Ruby Part 1

**Reading:** Ruby Tutorial Sections 3, 5, 6, 7, 13, 14, and 15

**Installing Ruby:** You can install ruby using instructions found at the following sites:
* [Windows](https://rubyinstaller.org/)
* [Mac](https://www.ruby-lang.org/en/documentation/installation/#homebrew)
* [Linux](https://www.ruby-lang.org/en/documentation/installation/#apt)

### Outside of Class

[Watch this Video](https://youtu.be/wSsItJuNd-U)

Explore Ruby:
- Find the following things:
  - The Ruby API
  - The free online version of *"Programming Ruby: The Pragmatic Programmer's Guide"*
  - A method that substitutes part of a string
  - Information about Ruby's regular expressions
  - Information about Ruby's ranges
- Do the following things:
  - Print the string "Hello, World"
  - For the string "Hello, Ruby", find the index of the word "Ruby"
  - Print your name 10 times
  - Print the string "This is sentence number 1" where the number 1 changes from 1 to 10.
  - Run a Ruby program from a file

### Outline:
* [Hello World](https://raw.githubusercontent.com/CSCI305/csci305-ruby-examples/blob/master/basic/example1.rb)
* [Variables and Expressions](https://raw.githubusercontent.com/CSCI305/csci305-ruby-examples/blob/master/basic/example2.rb)
* [Operators](https://raw.githubusercontent.com/CSCI305/csci305-ruby-examples/blob/master/basic/example3.rb)
* [Strings](https://raw.githubusercontent.com/CSCI305/csci305-ruby-examples/blob/master/basic/example4.rb)
* [String Operators](https://raw.githubusercontent.com/CSCI305/csci305-ruby-examples/blob/master/basic/example5.rb)
* [Lists](https://raw.githubusercontent.com/CSCI305/csci305-ruby-examples/blob/master/basic/example6.rb)
* [Hashes](https://raw.githubusercontent.com/CSCI305/csci305-ruby-examples/blob/master/basic/example7.rb)
* [Line Breaking in Code](https://raw.githubusercontent.com/CSCI305/csci305-ruby-examples/blob/master/basic/example8.rb)

### In class exercise:
Write a ruby program which prompts for and reads one line of input. It then echos the line, then prints it repeatedly, each time removing every second character. It continues until no more characters can be removed. Treat all characters alike; no special treatment for spaces or punctuation

```
Please enter a line> Sandy.
Sandy.
Sny
Sy
S
tom@laptop:~/courses/ruby/asst$ ruby reduce.rb
Please enter a line> On Tuesday, Frank in the motor pool buys lunch.
On Tuesday, Frank in the motor pool buys lunch.
O usa,Faki h oo olby uc.
OuaFk  oob c
Oak o
Oko
Oo
O
tom@laptop:~/courses/ruby/asst$ ruby reduce.rb
Please enter a line> Those so aglow point at hues afferent
Those so aglow point at hues afferent
Toes go on the feet
Te oo h et
T ohe
Toe
Te
T
```
