# fizzbuz
(1..15).each do |val|
  if val % 15 == 0
    puts "FizzBuzz"
  elsif val % 5 == 0
    puts "Buzz"
  elsif val % 3 == 0
    puts "Fizz"
  else
    puts val
  end
end

# case statment
["a","b","c"].each do |str|
  case str
  when "a"
    puts "I'm a a"
  when "b"
    puts "I'm a b"
  else
    puts "default"
  end
end

a = true
b = false

# OR
puts a || b
# => true

# AND
puts a && b
# => false

i = 3
j = 5

# GT/ LT
puts j > i # true
puts j < i # false

# equals
puts j == i # false
puts j != i # true
