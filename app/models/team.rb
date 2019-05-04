class Team < ApplicationRecord
  belongs_to :user
  belongs_to :season
  has_many :drafts
  has_many :games, class_name: 'Game', foreign_key: :home_team
  has_many :games, class_name: 'Game', foreign_key: :away_team

  validates :name, presence: true, uniqueness: { scope: :season }
  validates :main_colour, presence: true
  validates :secondary_colour, presence: true
  validates [:main_colour, :secondary_colour], uniqueness: { scope: :season }
end
