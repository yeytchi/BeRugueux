class AddStatusToSeasons < ActiveRecord::Migration[5.2]
  def change
    add_column :seasons, :status, :integer, default: 0
  end
end
