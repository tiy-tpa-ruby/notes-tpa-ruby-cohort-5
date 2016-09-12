class DefinitionsController < ApplicationController
  def show_def
    @term = params[:term]

    url = URI.escape("http://api.wordnik.com:80/v4/word.json/#{URI.escape(@term)}/definitions?limit=10&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")
    @results = HTTParty.get(url)

    @definitions = @results.map { |result| result["text"] }
  end
end
