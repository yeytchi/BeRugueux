class RemoveHomeTeamAndAwayTeamFromGames < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :away_team
    remove_column :games, :home_team
  end
end
