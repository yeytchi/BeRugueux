class CreateDrafts < ActiveRecord::Migration[5.2]
  def change
    create_table :drafts do |t|
      t.integer :team
      t.integer :player
      t.integer :amount

      t.timestamps
    end
  end
end
