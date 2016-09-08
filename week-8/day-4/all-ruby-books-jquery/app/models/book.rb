class Book < ApplicationRecord
  has_many :authorships
  has_many :authors, through: :authorships

  has_many :categorizations
  has_many :categories, through: :categorizations
end
