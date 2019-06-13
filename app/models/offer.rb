class Offer < ApplicationRecord
  belongs_to :team
  belongs_to :player

  validates :amount, presence: true, numericality: { greater_than: 0 }
  # validates :amount, numericality: { less_than: team.budget }
end
