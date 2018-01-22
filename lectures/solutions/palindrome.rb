def palindrome? str
  str == str.reverse()
end

print "Please enter a word> "

line = gets.chomp

puts line
puts line.reverse()
puts "#{line} is a palindrome" if palindrome? line.downcase
