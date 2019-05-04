class Draft < ApplicationRecord
  belongs_to :team
  belongs_to :player

  validates :amount, presence: true
end
