integer = 1
float = 1.0

result = 4 + 5.1
p result
# => 9.1

5.6.to_i
# => 5

5.3.floor
# => 5

5.3.ceil
# => 6

5.6666.round(2)
# => 5.67

3 / 4
# => 0

3.0 / 4
# => 0.75

# mod
3 % 4
# => 3

str = "A"
str * 2
# AA

str + 1
# => TypeError: no implicit conversion of Fixnum into String

puts "#{str}#{integer}"
# A1

1.to_s
# => "1"
