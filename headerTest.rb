# Source: https://github.com/jnunemaker/httparty/blob/master/examples/headers_and_user_agents.rb

require 'rubygems'
require 'httparty'

response = HTTParty.get('http://example.com', {
  headers: {"User-Agent" => "Httparty"},
  debug_output: STDOUT, # To show that User-Agent is Httparty
})