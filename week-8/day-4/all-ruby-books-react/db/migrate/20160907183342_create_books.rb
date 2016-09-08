class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :year
      t.string :url
      t.string :prices
      t.string :editor

      t.timestamps
    end
  end
end
