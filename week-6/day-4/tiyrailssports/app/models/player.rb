class Player < ApplicationRecord
  # Since players table now has `user_id` we can relate these two
  # models (tables) - since *this* table has the id, we `belongs_to` the other
  belongs_to :user, optional: true
  has_many :rosters, dependent: :delete_all
  has_many :teams, through: :rosters

  # Refile profile image for this player
  attachment :profile_image

  validates :name, presence: true

  def authorized?(user_whos_asking)
    # longhand way
    #
    # if user == user_whos_asking
    #   true
    # else
    #   false
    # end

    # The more 'Ruby way'
    user == user_whos_asking
  end
end
