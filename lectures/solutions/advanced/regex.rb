#!/usr/bin/env ruby

# Example regular expressions
# Basics
string = "The quick 12 brown foxes jumped over the 10 lazy dogs"

# check if string contains letter 'o'
puts string =~ /o/

puts string =~ /quick/

# using the ternary operator
puts string =~ /z/ ? "Valid" : "Invalid"

puts string =~ /Z/ ? "Valid" : "Invalid" # case sensitivity

puts string =~ /Z/i ? "Valid" : "Invalid" # case insensitive modifier

# Scanning for not only existence but also for actual value
puts string.to_enum(:scan, /\d+/).map { Regexp.last_match })

# matching a generic user name which can be composed of lowercase characters, numbers, an underscore, or a dash and which must be at least 6 but no more than 18 characters in length.
/^[a-z0-9_-]{6,18}$/

# matching a netid, which is a single lowercase character followed by two digits followed by a single characters followed by three digits
/^[a-z]\d{2}[a-z]\d{3}$/

# matching a URL: A url starts with either http or https followed by :// then a server name which can be composed of digits, letters, and dots followed by a dot and then the a 2-6 character long identifier followed by a possible path starting with / which can be letters, numbers, undescores, dots, or hyphens and possibly ending in a forward slash.
/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w_\.-]*)*\/?$/
