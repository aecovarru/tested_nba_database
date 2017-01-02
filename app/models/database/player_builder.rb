module Database
  class PlayerBuilder
    def basketball_reference(endpoint)
      url = "http://www.basketball-reference.com/#{endpoint}"
      return Nokogiri::HTML(open(url))
    end

    def build(year)
      @season = Season.find_by_year(year)
      doc = basketball_reference("/leagues/NBA_#{year}_games.html")
      doc.css(".left").each_slice(4) do |row|
        create_player(row) unless header_row?(row)
      end
    end

    def create_player(row)
    end
  end
end