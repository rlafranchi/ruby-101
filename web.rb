# open-uri for simple get requests
require 'open-uri'
google_sitemap = "https://www.google.com/sitemap.xml"
uri = URI.parse(google_sitemap)

puts uri.path
# /sitemap.xml

puts uri.host
# uri.hostname => latest ruby
# www.google.com

response = open(uri)

p response.status
# => ["200", "OK"] 

puts response.content_type
# text/xml

# reads the body of the response
body = response.read

# parse it as needed
require 'nokogiri'
doc = Nokogiri::XML(body) {|cfg| cfg.dtdvalid}
puts doc.text

# other librarirs
# net/http
# example POST request
# http://httpbin.org - useful for testing
require 'net/http'
uri = URI('http://httpbin.org/post')
res = Net::HTTP.post_form(uri, 'query' => 'ruby')
puts res.body

# Auth Basic example
uri = URI.parse('http://httpbin.org/basic-auth/user/passwd')
req = Net::HTTP::Get.new(uri.path)
req.basic_auth 'user', 'passwd'
res = Net::HTTP.start(uri.host, uri.port) do |http|
  http.request req # Net::HTTPResponse object
end
puts res.body
