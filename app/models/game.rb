class Game < ApplicationRecord
  has_many :periods
  belongs_to :season
  belongs_to :game_date
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"
end
