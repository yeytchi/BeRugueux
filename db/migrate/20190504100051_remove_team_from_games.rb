class RemoveTeamFromGames < ActiveRecord::Migration[5.2]
  def change
    remove_reference :games, :team, foreign_key: true
  end
end
