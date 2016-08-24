class CreateRosters < ActiveRecord::Migration[5.0]
  def change
    create_table :rosters do |t|
      t.references :term, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
    remove_column :terms, :category_id
  end
end
