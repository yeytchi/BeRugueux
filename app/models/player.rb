class Player < ApplicationRecord
  # belongs_to :team, optional: true
  has_many :drafts, dependent: :destroy
  has_many :statistics

  validates :first_name, :last_name, :club, :kicking_accuracy, :position, presence: true
  validates :first_name, uniqueness: { scope: :last_name }

  enum status: { rest: 0, playing: 1 }
end
