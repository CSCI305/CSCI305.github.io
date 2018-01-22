print "Please enter a line> "
line = gets.chomp

puts line
until line.length < 2 do
  new_line = ""
  (0..(line.length - 1)).step(2) do |x|
    new_line += line[x]
  end
  puts new_line
  line = new_line
end
