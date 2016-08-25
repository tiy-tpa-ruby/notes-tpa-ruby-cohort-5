class FixProfileImageColumnOnPlayers < ActiveRecord::Migration[5.0]
  def up
    change_column :players, :profile_image_id, :string
  end

  def down
    change_column :players, :profile_image_id, :integer
  end
end
