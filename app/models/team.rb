class Team < ApplicationRecord
  belongs_to :user
  belongs_to :season
  has_many :drafts, dependent: :destroy
  # has_many :players
  has_many :players, through: :drafts
  has_many :statistics, through: :games

  has_many :home_games, class_name: 'Game', foreign_key: 'home_team_id'
  has_many :away_games, class_name: 'Game', foreign_key: 'away_team_id'

  validates :name, presence: true, uniqueness: { scope: :season }
  validates :main_colour, presence: true
  validates :secondary_colour, presence: true

  # I want to validate the uniqueness of the couple main/secondary, within a single season.
  # validates [:main_colour, :secondary_colour], uniqueness: { scope: :season }

  enum status: { recruiting: 0, complete: 1 }
end
