class AddJerseyColorToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :jersey_color, :string, default: "blue", null: false
  end
end
