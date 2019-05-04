class Statistic < ApplicationRecord
  belongs_to :game
  belongs_to :player

  validates :real_game_id, presence: true, uniqueness: true
  validates :rating, presence: true
  validates :minutes_played, presence: true
  validates :tries, presence: true
  validates :transformations, :kick_attempts, :successful_kicks, :conceded_penalties, presence: true
end
