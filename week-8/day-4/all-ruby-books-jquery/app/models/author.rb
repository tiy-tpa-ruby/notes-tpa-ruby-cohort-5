class Author < ApplicationRecord
  has_many :authorships
  has_many :books, through: :authorships

  def profile_image
    gravatar = Gravatar.new(email)

    gravatar.thumbnail
  end
end
