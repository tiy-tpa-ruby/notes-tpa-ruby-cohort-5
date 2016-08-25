class AddUserIdToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :user_id, :integer
  end
end
