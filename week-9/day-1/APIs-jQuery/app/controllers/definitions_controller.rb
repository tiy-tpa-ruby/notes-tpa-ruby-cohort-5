class DefinitionsController < ApplicationController
  def show_def
    api_class = current_user.premium? ? Api::Websters : Api::Wordnik

    # Ternary above is shorthand for one of these:
    #
    # if current_user.premium?
    #   api_class = Api::Websters
    # else
    #   api_class = Api::Wordnik
    # end
    #
    # api_class = if current_user.premium?
    #               Api::Websters
    #             else
    #               Api::Wordnik
    #             end

    @definitions = api_class.new(params[:term]).definitions
  end
end
