class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.references :team, foreign_key: true
      t.references :player, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
