# Arrays

arr = [1, 2, 3]
# => [1, 2, 3]

# maximum and minimum values in the array
arr.max
# => 3
arr.min
# => 1

# first and last elements in the array
arr.last # 1
arr.first # 3

arr = [1, 2, 3]
# loop
arr.each do |val|
  puts val
end
# 1
# 2
# 3
# => [1, 2, 3]

# alt. loop
for i in (0..arr.size-1)
  puts arr[i]
end

for val in arr
  puts val 
end

i = 0
while i < arr.size
  puts arr[i]
  i += 1
end

# each with index
arr.each_with_index do |val,index|
  # index: 0, val: 1
  puts "index: #{index}, val: #{val}"
end

# sort
p [5, 3, 2, 4, 1].sort
# => [1, 2, 3, 4, 5]

# join
puts ["a", "b", "c"].join(":")
# => "a:b:c"

# pop
arr = ["a", "b", "c"]
arr.pop
# => "c"
p arr
# => ["a", "b"]

# push
arr.push("d")
p arr
# => ["a", "b", "d"]
arr << "e"
p arr
# => ["a", "b", "d", "e"]

# map
arr = ["a", "b", "c"]
p arr.map { |val| "the letter is: #{val}" }
# => ["the letter is: a", "the letter is: b", "the letter is: c"]

# select
p [5, 3, 2, 7, 8].select { |val| val > 5 }
# => [7, 8]

# flatten
arr = [[1, 2],[2, 4],[3, 6, 7]]
p arr.flatten
# => [1, 2, 2, 4, 3, 6, 7]

