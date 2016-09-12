module Api
  class Websters
    # Provide the term to the initializer
    # for whatever word/term you want to lookup
    def initialize(term)
      @term = term
    end

    # Returns an array of strings of all the
    # definitions of the term supplied in the initializer
    def definitions
      # Some httparty work to fetch definitions from Websters
    end
  end
end
