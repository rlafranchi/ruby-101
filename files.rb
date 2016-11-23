# open a new file

contents = <<EOF
#### FILE ####
# HELLO
EOF

puts "Writing test.txt....."
File.open("./test.txt", 'w+') do |f|
  f.write(contents)
end

# append a line
puts "Appending test.txt...."
File.open("./test.txt", "a") do |f|
  f << "A new line"
end

# read a file
puts "Reading test.txt...."
body = File.read("./test.txt")
puts body

# list all ruby files in current directory
Dir["./*.rb"]


# CSV
# load the csv library
require 'csv'

# write to new file
CSV.open("./test.csv", "w+") do |csv|
  csv << ["one", "row"]
  csv << ["another", "row"]
end

# or generate a string
csv_string = CSV.generate do |csv|
  csv << ["one", "row"]
  csv << ["another", "row"]
end
puts csv_string

# read a csv file
CSV.read("./test.csv")
puts csv_string
# => [["one", "two"]["another", "row"]]

# JSON
# load the json library
require 'json'
ruby_hash = {
  one: "one",
  two: "two"
}
# convert to a json string 
json_string = ruby_hash.to_json
File.open("./test.json", 'w+') do |f|
  f.write(json_string)
end

# parse json
body = File.read("./test.json")
ruby_hash = JSON.parse(body)
p ruby_hash
# => {:one=>"one",:two=>"two"}
