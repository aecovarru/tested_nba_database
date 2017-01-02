class GameDate < ApplicationRecord
  has_many :games
  belongs_to :season
end