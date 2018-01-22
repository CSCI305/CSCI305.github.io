def palindrome? str
  str == str.reverse()
end

print "Please enter a line> "
line = gets.chomp

puts line
puts line.reverse()

line.gsub!(/\s/, '')
puts line
puts line.reverse()

puts "The line is a palindrome" if palindrome? line.downcase
