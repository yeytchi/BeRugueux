class Position < ApplicationRecord
  has_many :players_positions
  has_many :players, through: :players_positions

  validates :name, presence: true
end
