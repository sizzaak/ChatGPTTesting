require 'rubygems'
require 'dotenv'
Dotenv.load('.env.dev')
require 'httparty'
require 'json'

class OpenAIInterface
  def initialize()
    @models = []
  end

  # Requests a list of models from OpenAI and saves the list if successful,
  # returning the response code of the curl request
  def queryModels()
    response = HTTParty.get('https://api.openai.com/v1/models', {
      headers: {"Authorization" => "Bearer " + ENV["OPENAI_API_KEY"]}
    })
    if response.code == 200
      parsed = JSON.parse(response.body)
      @models = parsed["data"]
    end
    return response.code
  end

  # Returns the list of models as an array of hashes containing all model info
  def getModels()
    return @models
  end

  # Returns a list of just the names of all OpenAI models
  def getModelNames()
    list = []
    for m in @models
      list.push(m["id"])
    end
    return list
  end

end

interface = OpenAIInterface.new
puts interface.queryModels
puts interface.getModelNames