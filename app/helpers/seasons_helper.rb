module SeasonsHelper
  def season_link(season)
    link_to season.year, season_path(season)
  end
end
