class Player < ApplicationRecord
  has_many :offers, dependent: :destroy
  has_many :statistics
  has_many :selections, dependent: :destroy
  has_many :teams, through: :selections
  has_many :players_positions
  has_many :positions, through: :players_positions

  validates :first_name, :last_name, :club, :kicking_accuracy, :position, presence: true
  validates :first_name, uniqueness: { scope: :last_name }

  enum status: { rest: 0, playing: 1 }

  def best_offer
    player.offers.max_by(1) { |offer| offer.amount }.first
  end
end
