class Category < ApplicationRecord
  has_many :terms, through: :rosters
  has_many :rosters
end
