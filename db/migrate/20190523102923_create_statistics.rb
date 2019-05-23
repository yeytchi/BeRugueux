class CreateStatistics < ActiveRecord::Migration[5.2]
  def change
    create_table :statistics do |t|
      t.references :player, foreign_key: true
      t.references :game, foreign_key: true
      t.integer :real_game_id
      t.integer :rating
      t.integer :minutes_played
      t.integer :tries
      t.integer :transformations
      t.integer :kick_attempts
      t.integer :successful_kicks
      t.integer :conceded_penalties
    end
  end
end
