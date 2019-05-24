class AddReferencesToGames < ActiveRecord::Migration[5.2]
  def change
    add_reference :games, :home_team
    add_reference :games, :away_team
  end
end
