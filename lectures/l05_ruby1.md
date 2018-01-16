# CSCI 305 Programming Languages

## Ruby Part 1

**Reading:** Ruby Tutorial Sections 3, 5, 6, 7, 13, 14, and 15

**Installing Ruby:** You can install ruby using instructions found at the following sites:
* [Windows](https://rubyinstaller.org/)
* [Mac](https://www.ruby-lang.org/en/documentation/installation/#homebrew)
* [Linux](https://www.ruby-lang.org/en/documentation/installation/#apt)

### Outside of Class

[Watch this Video](https://youtu.be/sVDYxiO0fU4) - (1:35:29)

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
* Interactive ruby
  - [Hello World!](https://raw.github.com/CSCI305/csci305-ruby-examples/ruby1/01irb.rb)
  - [Basic Expressions](https://raw.github.com/CSCI305/csci305-ruby-examples/ruby1/02irb_expr.rb)
  - [Decisions](https://raw.github.com/CSCI305/csci305-ruby-examples/ruby1/03irb_decisions.rb)
  - [Global Variables](https://raw.github.com/CSCI305/csci305-ruby-examples/ruby1/04irb_global.rb)
  - [What is Truth?](https://raw.github.com/CSCI305/csci305-ruby-examples/ruby1/05irb_truth.rb)
* Ruby Scripts
  - [Multiline Strings](https://raw.github.com/CSCI305/csci305-ruby-examples/ruby1/04strings.rb)
  - [Basic String Ops](https://raw.github.com/CSCI305/csci305-ruby-examples/ruby1/05strings.rb)
  - [Chomping Strings](https://raw.github.com/CSCI305/csci305-ruby-examples/ruby1/06strings.rb)
  - [Working with Strings](https://raw.github.com/CSCI305/csci305-ruby-examples/ruby1/07strings.rb)
  - [Numbers and Iteration](https://raw.github.com/CSCI305/csci305-ruby-examples/ruby1/08numbers.rb)
  - [Arrays](https://raw.github.com/CSCI305/csci305-ruby-examples/ruby1/09arrays.rb)
  - [Hashes](https://raw.github.com/CSCI305/csci305-ruby-examples/ruby1/10hashes.rb)
  - [Control Structures](https://raw.github.com/CSCI305/csci305-ruby-examples/ruby1/11control.rb)
  - [Methods](https://raw.github.com/CSCI305/csci305-ruby-examples/ruby1/12methods.rb)
  - [Methods](https://raw.github.com/CSCI305/csci305-ruby-examples/ruby1/13methods.rb)
  - [Methods](https://raw.github.com/CSCI305/csci305-ruby-examples/ruby1/14methods.rb)
  - [Blocks](https://raw.github.com/CSCI305/csci305-ruby-examples/ruby1/15blocks.rb)
  - [Gets](https://raw.github.com/CSCI305/csci305-ruby-examples/ruby1/16gets.rb)
  - [Gets](https://raw.github.com/CSCI305/csci305-ruby-examples/ruby1/17gets.rb)
  - [Ranges](https://raw.github.com/CSCI305/csci305-ruby-examples/ruby1/18ranges.rb)
  - [Illusions of Regex](https://raw.github.com/CSCI305/csci305-ruby-examples/ruby1/19regex.rb)
  - [songdata.txt](https://raw.github.com/CSCI305/csci305-ruby-examples/ruby1/)

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
