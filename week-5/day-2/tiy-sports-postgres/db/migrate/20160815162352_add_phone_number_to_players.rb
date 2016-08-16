class AddPhoneNumberToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :phone_number, :string
  end
end
