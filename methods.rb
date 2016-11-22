# define a method
def hello_world
  puts "Hello World"
end

hello_world
# => "Hello World"

# default value
def hello_world(str='default')
  puts str
end

hello_world
# => "default"

# arguments
def sum(a, b)
  a + b
end

result = sum(2,3)
puts result
# => 5

# blocks
def block_example
  puts "Before..."
  yield
  puts "After.."
end

block_example do
  puts "Block Yielded" 
end
# => "Block yielded"

# block with parameter

def block_example
  yield('World')
end

block_example do |str|
  puts "Hello #{str}"
end
# => Hello World

# Alternate syntax
block_example { |str| puts "Hello #{str}" }

# check if it has a block
def block_example
  if block_given?
    yield
  else
    puts "no block"
  end
end

block_example
# no block
block_example { puts "block provided" }
# block provided

# allows any number of arguments 
def args(*args)
  puts args[0]
  puts args[1]
end

args("first","second")
# first
# second

# Keyword arguments
# Ruby 2.0 and above
def k_args(one: 'default', two: 'default')
  puts one
  puts two
end

k_args(two: "two", one: "one")
# one
# two 
