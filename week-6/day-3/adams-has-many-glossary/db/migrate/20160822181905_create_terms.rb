class CreateTerms < ActiveRecord::Migration[5.0]
  def change
    create_table :terms do |t|
      t.string :name
      t.text :definition
      t.string :author
      t.string :web_link
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
