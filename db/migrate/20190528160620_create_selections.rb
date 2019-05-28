class CreateSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :selections do |t|
      t.references :player, foreign_key: true
      t.references :team, foreign_key: true
      t.references :offer, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
