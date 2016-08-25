class AddProfileImageToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :profile_image_id, :integer
  end
end
