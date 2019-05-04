class CreateSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons do |t|
      t.integer :user
      t.string :name
      t.integer :number_of_teams
      t.string :calendar

      t.timestamps
    end
  end
end
