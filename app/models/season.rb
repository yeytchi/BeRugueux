class Season < ApplicationRecord
  belongs_to :user
  has_many :teams

  validates :name, presence: true
  validates :number_of_teams, presence: true, inclusion: { in: [2, 4, 6] }

  enum status: { joining: 0, complete: 1 }
end
