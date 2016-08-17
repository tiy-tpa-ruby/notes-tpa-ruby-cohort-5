class Player < ApplicationRecord
  validates :name, presence: true
end
