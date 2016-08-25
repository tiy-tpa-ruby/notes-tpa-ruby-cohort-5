class Team < ApplicationRecord
  has_many :rosters, dependent: :delete_all
  has_many :players, through: :rosters
end
