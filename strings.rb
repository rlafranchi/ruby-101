str = "Hello World"
# => "Hello World"

puts str.length
# => 11

puts str[0]
# => "H"

puts str[-1]
# => "d"

puts str.delete("l")
# => "Heo World"

puts str
# => "Hello World"

# bang mutates original object
str.delete!("l")
puts str
# => "Heo World"


# p vs puts
# p prints the return value of an object

p "Hello\nWorld"
# "Hello\nWorld"

puts "Hello\nWorld"
# Hello
# World

# Regexp
# matches is a MatchData object
matches = /l/.match "Hello World"
puts matches[0]
# => l

# split into an array
p "Hello World".split(" ")
# => ["Hello", "World"]

# also takes a regexp
p "Hello     World".split(/\s+/)
# => ["Hello", "World"]

# #{} syntax
str = "cruel"
puts "Hello #{str} World"
