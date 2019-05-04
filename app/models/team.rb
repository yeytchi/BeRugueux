class Team < ApplicationRecord
  belongs_to :user
  belongs_to :season
  has_many :drafts
  has_many :games
end
