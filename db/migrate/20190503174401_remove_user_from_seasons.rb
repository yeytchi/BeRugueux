class RemoveUserFromSeasons < ActiveRecord::Migration[5.2]
  def change
    remove_column :seasons, :user
  end
end
