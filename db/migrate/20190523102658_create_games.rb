class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.references :day, foreign_key: true
      t.references :home_team
      t.references :away_team
      t.boolean :played, default: false
      t.integer :home_team_score
      t.integer :away_team_score
    end
  end
end
