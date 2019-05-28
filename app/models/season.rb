class Season < ApplicationRecord
  belongs_to :user
  has_many :teams, dependent: :destroy
  has_many :days, dependent: :destroy
  has_many :games, through: :days, dependent: :destroy

  validates :name, presence: true
  validates :number_of_teams, presence: true, inclusion: { in: [2, 4, 6] }

  enum status: { joining: 0, complete: 1 }

end
