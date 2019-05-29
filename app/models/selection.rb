class Selection < ApplicationRecord
  belongs_to :player
  belongs_to :team
  belongs_to :offer

  validates :amount, presence: true
end
