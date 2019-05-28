class Player < ApplicationRecord
  has_many :offers, dependent: :destroy
  has_many :statistics
  has_many :selections, dependent: :destroy

  validates :first_name, :last_name, :club, :kicking_accuracy, :position, presence: true
  validates :first_name, uniqueness: { scope: :last_name }

  enum status: { rest: 0, playing: 1 }
end
