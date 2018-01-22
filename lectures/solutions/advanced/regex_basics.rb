puts "foobar".sub('bar', 'foo') # example when to use regex
# sub will only replace first
puts "barfoobar".sub('bar', 'foo')
# need to use global substitution
puts "barfoobar".gsub('bar', 'foo')
# note you can use sub! and gsub! to replace in the string rather than return

a = "yo, what do you want?"
puts a.sub(/^../, 'Excuse me sir') # replace first two characters

# regex in loops
# 3 characters at a time
a = "wow ruby is the greatest"
a.scan(/.../) { |s| puts s }

a.scan(/\S\S\S/) { |s| puts s } # no spaces, \S is any non-whitespace, misses the last two

# Extracting numbers and character classes


# Decision making
