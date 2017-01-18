class Season < ApplicationRecord
  has_many :teams, dependent: :destroy
  has_many :game_dates, dependent: :destroy
  has_many :games, dependent: :destroy
  has_many :players, as: :intervalable, dependent: :destroy
end
