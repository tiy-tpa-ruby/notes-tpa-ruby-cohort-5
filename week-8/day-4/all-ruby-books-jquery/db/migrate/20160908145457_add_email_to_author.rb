class AddEmailToAuthor < ActiveRecord::Migration[5.0]
  def change
    add_column :authors, :email, :string
  end
end
