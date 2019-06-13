class CreateSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.integer :number_of_teams
      t.integer :status, default: 0
      t.integer :round, default: 1

      t.timestamps
    end
  end
end
