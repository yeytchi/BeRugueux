class AddDefaultValuesToStatistics < ActiveRecord::Migration[5.2]
  def change
    change_column :statistics, :tries, :integer, default: 0
    change_column :statistics, :transformations, :integer, default: 0
    change_column :statistics, :kick_attempts, :integer, default: 0
    change_column :statistics, :successful_kicks, :integer, default: 0
    change_column :statistics, :conceded_penalties, :integer, default: 0
  end
end
