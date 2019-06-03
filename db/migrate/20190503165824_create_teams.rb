class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.references :season, foreign_key: true
      t.references :user, foreign_key: true
      t.string :name
      t.string :logo
      t.string :main_colour
      t.string :secondary_colour
      t.integer :status, default: 0
      t.integer :budget, default: 1000

      t.timestamps
    end
  end
end
