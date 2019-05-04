class Player < ApplicationRecord
  has_many :drafts
  has_many :statistics

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates [:first_name, :last_name], uniqueness: true
  validates :club, presence: true
  validates :kicking_accuracy, :kicker, :position, :injured, presence: true

  enum status: { rest: 0, playing: 1 }
end
