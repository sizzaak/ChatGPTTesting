# Source: https://rails.devcamp.com/trails/ruby-programming/campsites/working-with-apis-in-ruby/guides/how-to-use-the-httparty

require 'rubygems'
require 'httparty'

response = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')

# puts response.body
# puts response.code
# puts response.message
puts response.headers.inspect