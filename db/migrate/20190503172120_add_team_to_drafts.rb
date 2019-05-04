class AddTeamToDrafts < ActiveRecord::Migration[5.2]
  def change
    add_reference :drafts, :team, foreign_key: true
  end
end
