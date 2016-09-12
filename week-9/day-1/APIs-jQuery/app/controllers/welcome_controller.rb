class WelcomeController < ApplicationController
  def index
    @terms = Term.all.order(created_at: :desc).take(5)
    @categories = Category.all
  end
end
