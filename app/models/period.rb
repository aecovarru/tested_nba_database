class Period < ApplicationRecord
  has_many :players, as: :intervalable
  belongs_to :game
end
