# CSCI 305 Programming Languages

### Ruby Regular Expressions

### Out of Class

#### Instructions
1. [Watch This Video](https://youtu.be/qCCh5nQyXAo) - (1:17:53)
2. Complete the out of class exercise below
3. Use the following tutorials for help
4. Review the [Solutions Video](https://youtu.be/wJdjKmfIN0E) for the example exercises - (22:06)

**Readings and Tools:**
* [Ruby Tutorial](https://www.tutorialspoint.com/ruby/ruby_regular_expressions.htm)
* [Regular Expressions](http://ruby-doc.com/docs/ProgrammingRuby/html/tut_stdtypes.html)
* [Another Tutorial](http://rubylearning.com/satishtalim/ruby_regular_expressions.html)
* [Tool to explore Ruby Regular Expressions](http://rubular.com/)

## Out of Class Exercises

#### Exercise: Write a language filter

Corralling the foul language on the Internet would be an excruciatingly tough job without the use of regular expressions, which give you the capability of catching undesirable words while not blocking out acceptable but similar words.

Working from the text provided below, write a filter that turns all instances and variations of "ass" into "a**" without obfuscating words like "pass".

```
Don't take my hall pass, you ass. - User 101, 7:40 AM
You are a total a$$-wipe - User 206, 7:45 AM
As I've said earlier, the document must be read assiduously in
 order to assure quality - User 42 9:12 AM
You're an a55hole, kiss my ASS - User 101, 9:40 PM
```

Construct a short program (working with the provided code), focusing on the development and application of a regular expression that will filter out and replace foul language.

**Starting Code:** Open a new file and copy this code into it and start cleaning up the messages:
```ruby
messages = ["Don't take my hall pass, you ass. - User 101, 7:40 AM",
"You are a total a$$-wipe - User 206, 7:45 AM",
"As I've said earlier, the document must be read assiduously in order to assure quality - User 42 9:12 AM",
"You're an a55hole, kiss my ASS - User 101, 9:40 PM"]

# Method to detect and remove the word ass or any of its derivatives
def clean_message str

end

messages.each do |msg|
  # clean up each messages
  # print the cleaned message
end
```

**Solution:**
```ruby
messages = ["Don't take my hall pass, you ass. - User 101, 7:40 AM",
"You are a total a$$-wipe - User 206, 7:45 AM",
"As I've said earlier, the document must be read assiduously in order to assure quality - User 42 9:12 AM",
"You're an a55hole, kiss my ASS - User 101, 9:40 PM"]

# Method to detect and remove the word ass or any of its derivatives
def clean_message str
  regex = /\b[Aa][sS$5]{2}(-wipe|hole)?\b/
  str.gsub(regex, "***")
end

messages.each do |msg|
  cleaned = clean_message msg
  puts cleaned
end
```

**GOAL:** Produce the following output
```
Don't take my hall pass, you ***. - User 101, 7:40 AM
You are a total ***wipe - User 206, 7:45 AM
As I've said earlier, the document must be read assiduously in
 order to assure quality - User 42 9:12 AM
You're an ***, kiss my *** - User 101, 9:40 PM
```

### Outline and Examples
* [Show Regex](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby_regex/regex.rb)
* [Basic Patterns](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby_regex/regex01.rb)
* [Special Characters](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby_regex/regex02.rb)
* [Anchoring Patterns](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby_regex/regex03.rb)
* [Character Classes](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby_regex/regex04.rb)
* [Repetition and Alternation](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby_regex/regex05.rb)
* [Grouping](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby_regex/regex06.rb)
* [Pattern Based Substitution](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby_regex/regex07.rb)
* [Unescaping HTML Example](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby_regex/regex08.rb)
* [Email Example](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby_regex/regex_email.rb)

### In Class Exercise
#### Exercise: Find the Dates

Use the following code snippet (which creates an array) and a loop to extract out the date of each contract from the text of each item of the array and print the date to the console.

```ruby
contracts_arr =
   ["Hughes Missile Systems Company, Tucson, Arizona, is being awarded a $7,311,983 modification to a firm fixed price contract for the FY94 TOW missile production buy, total 368 TOW 2Bs. Work will be performed in Tucson, Arizona, and is expected to be completed by April 30, 1996. Of the total contract funds, $7,311,983 will expire at the end of the current fiscal year. This is a sole source contract initiated on January 14, 1991. The contracting activity is the U.S. Army Missile Command, Redstone Arsenal, Alabama (DAAH01-92-C-0260).",
   "Conventional Munitions Systems, Incorporated, Tampa, Florida, is being awarded a $6,952,821 modification to a firm fixed price contract for Dragon Safety Circuits Installation and retrofit of Dragon I Missiles with Dragon II Warheads. Work will be performed in Woodberry, Arkansas (90%), and Titusville, Florida (10%), and is expected to be completed by May 31, 1996. Contract funds will not expire at the end of the current fiscal year. This is a sole source contract initiated on May 2, 1994. The contracting activity is the U.S. Army Missile Command, Redstone Arsenal, Alabama (DAAH01-94-C-S076)."]
```

When finished your output should look something like the following:

```
April 30, 1996
May 31, 1996
```

##### Extension:
* Modify your solution to extract both the award and the date, such that your output is:

```
Award: $7,311,983 to be completed by: April 30, 1996
Award: $6,952,821 to be completed by: May 31, 1996
```

**Solution:**
```ruby
contracts_arr =
   ["Hughes Missile Systems Company, Tucson, Arizona, is being awarded a $7,311,983 modification to a firm fixed price contract for the FY94 TOW missile production buy, total 368 TOW 2Bs. Work will be performed in Tucson, Arizona, and is expected to be completed by April 30, 1996. Of the total contract funds, $7,311,983 will expire at the end of the current fiscal year. This is a sole source contract initiated on January 14, 1991. The contracting activity is the U.S. Army Missile Command, Redstone Arsenal, Alabama (DAAH01-92-C-0260).",
   "Conventional Munitions Systems, Incorporated, Tampa, Florida, is being awarded a $6,952,821 modification to a firm fixed price contract for Dragon Safety Circuits Installation and retrofit of Dragon I Missiles with Dragon II Warheads. Work will be performed in Woodberry, Arkansas (90%), and Titusville, Florida (10%), and is expected to be completed by May 31, 1996. Contract funds will not expire at the end of the current fiscal year. This is a sole source contract initiated on May 2, 1994. The contracting activity is the U.S. Army Missile Command, Redstone Arsenal, Alabama (DAAH01-94-C-S076)."]

contracts_arr.each do |contract|
  contract.match /(\$\d{1,3},\d{3},\d{3}\b).*?(\b[A-Z][a-z]+ \d{1,2}, \d{4}\b)/
  puts "Award: #{$1} to be completed by: #{$2}"
end
```
