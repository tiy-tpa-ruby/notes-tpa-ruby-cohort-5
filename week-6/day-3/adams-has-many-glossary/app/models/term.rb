class Term < ApplicationRecord
  has_many :categories, through: :rosters
  has_many :rosters
end
