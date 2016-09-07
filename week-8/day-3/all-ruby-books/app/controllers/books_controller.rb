class BooksController < ApplicationController
  def index
    author_id = params[:author_id]

    # If we have an author id, we must have a search
    if author_id
      author = Author.find(author_id)
      @books = author.books
    else
      # Otherwise, show all the books
      @books = Book.all
    end
    @authors = Author.all.order(:name)
  end
end
