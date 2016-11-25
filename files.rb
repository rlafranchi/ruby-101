# lates ruby versions will automatically load gems, so the following is not needed
require 'rubygems'
# open a new file

contents = <<EOF
#### FILE ####
# HELLO
EOF

puts "Writing test.txt....."
File.open("./test.txt", 'w') do |f|
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

# File paths
File.join("/var", "log") # /var/log

# FileUtils
require 'fileutils'
FileUtils.mkdir_p(File.join("foo","bar"))
# => ["foo/bar"]

# remove recursively
FileUtils.rm_r("foo")

puts FileUtils.pwd # current directory

# CSV
# load the csv library
require 'csv'

# write to new file
CSV.open("./test.csv", "w") do |csv|
  csv << ["one", "row"]
  csv << ["another", "row"]
end

# or generate a string
# Newer version syntax
# csv_string = CSV.generate do |csv|
#   csv << ["one", "row"]
#   csv << ["another", "row"]
# end
# puts csv_string

# read a csv file
csv_string = CSV.read("./test.csv")
p csv_string
# => [["one", "two"]["another", "row"]]

# JSON
# load the json library
require 'json'
ruby_hash = {
  :one => "one",
  :two => "two"
}
# convert to a json string 
json_string = ruby_hash.to_json
File.open("./test.json", 'w') do |f|
  f.write(json_string)
end

# parse json
body = File.read("./test.json")
ruby_hash = JSON.parse(body)
p ruby_hash
# => {:one=>"one",:two=>"two"}

# Nokogiri gem: http://www.nokogiri.org/
# run > gem install nokogiri
require 'pp'
require 'nokogiri'
xml_string = File.read("./google_sitemap.xml")
doc = Nokogiri::XML(xml_string)
urls = doc.css('loc').map { |location| location.text }
p urls
# => ["https://www.google.com/edu/sitemap.xml", "https://enterprise.google.com/sitemap.xml", "https://www.google.com/gmail/sitemap.xml", "https://www.google.com/forms/sitemaps.xml", "https://www.google.com/slides/sitemaps.xml", "https://www.google.com/sheets/sitemaps.xml", "https://www.google.com/adwords/sitemap.xml", "https://www.google.com/drive/sitemap.xml", "https://www.google.com/docs/sitemaps.xml", "https://www.google.com/calendar/sitemap.xml", "https://apps.google.com/sitemap.xml", "https://www.google.com/get/sitemap.xml"]
