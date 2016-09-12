module Api
  class Wordnik
    # Provide the term to the initializer
    # for whatever word/term you want to lookup
    def initialize(term)
      @term = term.downcase
    end

    # Returns an array of strings of all the
    # definitions of the term supplied in the initializer
    def definitions
      url = URI.escape("http://api.wordnik.com:80/v4/word.json/#{@term}/definitions?limit=10&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

      results = HTTParty.get(url)

      results.map { |result| result["text"] }
    end
  end
end
