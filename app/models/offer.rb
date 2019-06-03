class Offer < ApplicationRecord
  belongs_to :team
  belongs_to :player

  has_one :selection, dependent: :destroy

  zero = 0
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
