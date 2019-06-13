class Selection < ApplicationRecord
  belongs_to :player
  belongs_to :team

  validates :amount, presence: true
end
