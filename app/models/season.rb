class Season < ApplicationRecord
  has_many :teams
  has_many :game_dates
  has_many :players, as: :intervalable
end
