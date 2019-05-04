class AddTwoReferencesToGames < ActiveRecord::Migration[5.2]
  def change
    add_reference :games, :home_team, foreign_key: true
    add_reference :games, :away_team, foreign_key: true
  end
end
