class GamesController < ApplicationController
  def index
    @season = Season.find(params[:season_id])
    @games = @season.games
    @headers = %w(Date URL Link)
  end

  def show
    @game = Game.find(params[:id])
  end
end
