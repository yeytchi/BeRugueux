class Offer < ApplicationRecord
  belongs_to :team
  belongs_to :player

  has_one :selection, dependent: :destroy

  validates :amount, presence: true
end
