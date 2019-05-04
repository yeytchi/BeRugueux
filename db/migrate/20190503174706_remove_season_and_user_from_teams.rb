class RemoveSeasonAndUserFromTeams < ActiveRecord::Migration[5.2]
  def change
    remove_column :teams, :season
    remove_column :teams, :user
  end
end
