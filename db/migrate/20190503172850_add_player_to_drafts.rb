class AddPlayerToDrafts < ActiveRecord::Migration[5.2]
  def change
    add_reference :drafts, :player, foreign_key: true
  end
end
