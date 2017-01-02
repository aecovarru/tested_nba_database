module Database
  class GameBuilder
    def basketball_reference(endpoint)
      url = "http://www.basketball-reference.com/#{endpoint}"
      return Nokogiri::HTML(open(url))
    end

    def header_row?(row)
      row[0].text == "Date"
    end

    def build(year)
      @season = Season.find_by(year: year)
      doc = basketball_reference("/leagues/NBA_#{year}_games.html")
      doc.css(".left").each_slice(4) do |row|
        create_game(row) unless header_row?(row)
      end
    end

    def create_game(row)
      data_str = row[1]['csk']
      date = parse_date(data_str)
      away_team, home_team = parse_teams(data_str)
      game_date = GameDate.find_or_create_by(date: date, season: @season)
      game = Game.find_or_create_by(game_date: game_date, away_team: away_team, home_team: home_team)
    end

    def parse_date(data_str)
      date_str = data_str[4...-3]
      year = date_str[0..3].to_i
      month = date_str[4..5].to_i
      day = date_str[6..7].to_i
      return Date.new(year, month, day)
    end

    def parse_teams(data_str)
      away_abbr = data_str[0..2]
      home_abbr = data_str[-3..-1]
      away_team = Team.find_by_abbr(away_abbr)
      home_team = Team.find_by_abbr(home_abbr)
      return away_team, home_team
    end
  end
end