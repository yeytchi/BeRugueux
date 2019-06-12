class Season < ApplicationRecord
  belongs_to :user

  has_many :teams, dependent: :destroy
  has_many :offers, through: :teams
  has_many :selections, through: :teams
  has_many :players, through: :offers

  has_many :days, dependent: :destroy
  has_many :games, through: :days, dependent: :destroy

  validates :name, presence: true
  validates :number_of_teams, presence: true, inclusion: { in: [2, 4, 6] }

  enum status: { joining: 0, complete: 1 }
  # enum round: { round_one: 1, round_two: 2, round_three: 3, round_four: 4, round_five: 5 }
end
