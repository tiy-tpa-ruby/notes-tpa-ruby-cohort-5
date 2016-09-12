class Category < ApplicationRecord
  has_many :categorizations
  has_many :books, through: :categorizations
end
