module GamesHelper

  def game_link(game)
    link_to "#{game.away_team.name} @ #{game.home_team.name}", season_games_path(game)
  end

end
