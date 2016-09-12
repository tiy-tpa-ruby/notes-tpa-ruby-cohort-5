class AuthorsController < ApplicationController
  def profile_image
    author_id = params[:author_id]

    @book_id = params[:book_id]
    @author = Author.find(author_id)
  end
end
