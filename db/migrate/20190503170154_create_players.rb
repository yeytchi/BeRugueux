class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :club
      t.integer :kicking_accuracy
      t.boolean :kicker
      t.string :position
      t.boolean :injured, default: false
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
