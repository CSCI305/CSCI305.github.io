# CSCI 305 Programming Languages

## Ruby Part 1

**Reading:** Ruby Tutorial Sections 3, 5, 6, 7, 13, 14, and 15

**Installing Ruby:** You can install ruby using instructions found at the following sites:
* [Windows](https://rubyinstaller.org/)
* [Mac](https://www.ruby-lang.org/en/documentation/installation/#homebrew)
* [Linux](https://www.ruby-lang.org/en/documentation/installation/#apt)

### Outside of Class

[Watch this Video](https://youtu.be/sVDYxiO0fU4) - (1:35:29)

OR

Watch these videos (the above video broken into 6 parts for easier consumption):
* [Part 1](https://youtu.be/lUXaShxuywA) (15:46)
* [Part 2](https://youtu.be/H7Hg9mefp2s) (15:18)
* [Part 3](https://youtu.be/8eY5gEs1jiY) (15:46)
* [Part 4](https://youtu.be/6YGsn3YpcIY) (16:56)
* [Part 5](https://youtu.be/J-YWf9WojF4) (13:26)
* [Part 6](https://youtu.be/R0myl-4fKfU) (18:23)

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
  - [Hello World!](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby1/01irb.rb)
  - [Basic Expressions](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby1/02irb_expr.rb)
  - [Decisions](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby1/03irb_decisions.rb)
  - [Global Variables](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby1/04irb_global.rb)
  - [What is Truth?](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby1/05irb_truth.rb)
* Ruby Scripts
  - [Multiline Strings](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby1/04strings.rb)
  - [Basic String Ops](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby1/05strings.rb)
  - [Chomping Strings](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby1/06strings.rb)
  - [Working with Strings](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby1/07strings.rb)
  - [Numbers and Iteration](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby1/08numbers.rb)
  - [Arrays](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby1/09arrays.rb)
  - [Hashes](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby1/10hashes.rb)
  - [Control Structures](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby1/11control.rb)
  - [Methods](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby1/12methods.rb)
  - [Methods](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby1/13methods.rb)
  - [Methods](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby1/14methods.rb)
  - [Blocks](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby1/15blocks.rb)
  - [Gets](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby1/16gets.rb)
  - [Gets](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby1/17gets.rb)
  - [Ranges](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby1/18ranges.rb)
  - [Illusions of Regex](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby1/19regex.rb)
  - [songdata.txt](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby1/)

### In class exercises:

#### Excercise 1:
Write a ruby program which prompts for and reads one line of input. It then echos the line, then prints it repeatedly, each time removing every second character. It continues until no more characters can be removed. Treat all characters alike; no special treatment for spaces or punctuation

```
isaac@sparqline001 $ ruby reduce.rb
Please enter a line> Sandy.
Sandy.
Sny
Sy
S
isaac@sparqline001 $ ruby reduce.rb
Please enter a line> On Tuesday, Frank in the motor pool buys lunch.
On Tuesday, Frank in the motor pool buys lunch.
O usa,Faki h oo olby uc.
OuaFk  oob c
Oak o
Oko
Oo
O
isaac@sparqline001 $ ruby reduce.rb
Please enter a line> Those so aglow point at hues afferent
Those so aglow point at hues afferent
Toes go on the feet
Te oo h et
T ohe
Toe
Te
T
```

#### Exercise 2:
Write a quick ruby script to determine if a word is a palindrome. This script
should prompt the user for a single line of input and then echo the input, its reverse, and then whether or not it is a palindrome (regardless of case).

```
isaac@sparqline001 $ ruby palindrome.rb
Please enter a word> Bob
Bob
boB
Bob is a palindrome
```

#### Modification
Modify Exercise 2 such that if given a string with multiple words that forms a single palindrome when spaces are removed, you can detect that as well. Echo out the space reduced form of the line, its reverse, and whether or not it is a palindrome.

```
isaac@sparqline001 $ ruby palindrome2.rb
Please enter a line> Was it a car or a cat i saw
Was it a car or a cat i saw
was i tac a ro rac a ti saW
Wasitacaroracatisaw
wasitacaroracatisaW
The line is a palindrome
```
