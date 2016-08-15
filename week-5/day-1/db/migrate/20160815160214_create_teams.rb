class CreateTeams < ActiveRecord::Migration
  def change
    # Make a table called 'teams'
    create_table :teams do |t|
      # Add a column "name" that is a string
      t.string :name

      # Add a column "mascot" that is a string
      t.string :mascot

      # Add a column "sport" that is a string
      t.string :sport

      # Add the updated_at and created_at for us
      t.timestamps
    end
  end
end
