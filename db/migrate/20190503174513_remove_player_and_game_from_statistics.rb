class RemovePlayerAndGameFromStatistics < ActiveRecord::Migration[5.2]
  def change
    remove_column :statistics, :player
    remove_column :statistics, :game
  end
end
