class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.integer :season
      t.integer :user
      t.string :name
      t.string :logo
      t.string :main_colour
      t.string :secondary_colour

      t.timestamps
    end
  end
end
