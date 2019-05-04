class AddPlayerToStatistics < ActiveRecord::Migration[5.2]
  def change
    add_reference :statistics, :player, foreign_key: true
  end
end
