class Day < ApplicationRecord
  belongs_to :season
  has_many :games, dependent: :destroy
end
