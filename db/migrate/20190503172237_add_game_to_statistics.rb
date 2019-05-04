class AddGameToStatistics < ActiveRecord::Migration[5.2]
  def change
    add_reference :statistics, :game, foreign_key: true
  end
end
