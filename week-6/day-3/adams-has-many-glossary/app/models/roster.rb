class Roster < ApplicationRecord
  belongs_to :term
  belongs_to :category
end
