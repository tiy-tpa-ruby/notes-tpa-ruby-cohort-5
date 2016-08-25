class CreateRosters < ActiveRecord::Migration[5.0]
  def change
    create_table :rosters do |t|
      t.references :team, foreign_key: true
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
