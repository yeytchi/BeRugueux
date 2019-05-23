class Statistic < ApplicationRecord
  belongs_to :game
  belongs_to :player

  validates :real_game_id, presence: true, uniqueness: true
  validates :rating, presence: true, inclusion: { in: 0..10 }
  validates :minutes_played, presence: true, inclusion: { in: 0..80 }
  validates :tries, presence: true
  validates :transformations, :kick_attempts, :successful_kicks, :conceded_penalties, presence: true
end
