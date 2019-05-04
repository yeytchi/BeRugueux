class AddSeasonToTeams < ActiveRecord::Migration[5.2]
  def change
    add_reference :teams, :season, foreign_key: true
  end
end
