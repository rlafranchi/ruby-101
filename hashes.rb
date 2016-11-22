hash = {:key => "value", :another_key => "value"}
p hash
# => {:key=>"value"}

# getting a value for a key
puts hash[:key]
# => "value"

# setting a key
hash[:yet_another_key] = "another value"
p hash
# => {:key=>"value", :another_key=>"value", :yet_another_key=>"another value"}

# gets an array of keys
p hash.keys
# => [:key, :another_key, :yet_another_key] 

# get an array of the values
p hash.values
# => ["value", "value", "another value"] 

# sym vs string keys
puts hash["key"]
# => nil

hash["key"] = "string key"
p hash
# => {:key=>"value", :another_key=>"value", :yet_another_key=>"another value", "key"=>"string key"}

# iterate over a hash
hash.each do |key, value|
  puts "#{key} : #{value}"
end
# key : value
# another_key : value
# yet_another_key : another value
# key : string key

array_of_hashes = [
  {
    :id => 5,
    :name => "Five"
  },
  {
    :id => 3,
    :name => "Three" 
  }
]

# sort by
p array_of_hashes.sort_by { |hash| hash[:id] }
# => [{:id=>3, :name=>"Three"}, {:id=>5, :name=>"Five"}]

# add a hash
array_of_hashes << {
  :id => 6,
  :name => "Five"
}

# group by
p array_of_hashes.group_by { |hash| hash[:name] }
# => {"Five"=>[{:id=>5, :name=>"Five"}, {:id=>6, :name=>"Five"}], "Three"=>[{:id=>3, :name=>"Three"}]}
