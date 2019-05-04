class Season < ApplicationRecord
  belongs_to :user
  has_many :teams

  validates :name, presence: true
  validates :number_of_teams, presence: true

  enum status: { joining: 0, complete: 1 }
end
