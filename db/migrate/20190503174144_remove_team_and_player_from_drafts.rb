class RemoveTeamAndPlayerFromDrafts < ActiveRecord::Migration[5.2]
  def change
    remove_column :drafts, :player
    remove_column :drafts, :team
  end
end
