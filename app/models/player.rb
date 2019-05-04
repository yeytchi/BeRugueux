class Player < ApplicationRecord
  has_many :drafts
  has_many :statistics
end
