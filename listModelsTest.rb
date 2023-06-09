require 'rubygems'
require 'dotenv'
Dotenv.load('.env.dev')
require 'httparty'

response = HTTParty.get('https://api.openai.com/v1/models', {
  headers: {"Authorization" => "Bearer " + ENV["OPENAI_API_KEY"]}
})

puts response.message
puts
puts
puts response.body