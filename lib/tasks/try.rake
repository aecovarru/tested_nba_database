namespace :try do
  task :test => :environment do
    require 'open-uri'
    require 'nokogiri'
    require 'pp'

    year = 2016
    url = "http://www.basketball-reference.com/leagues/NBA_2017_games.html"
    doc = Nokogiri::HTML(open(url))
    doc.css(".left").each_slice(4) do |slice|
      game_str = slice[1]['csk']
      if game_str
        date_str = slice[1]['csk'][4...-3]
        date = parse_date(date_str)
      end
    end
  end
end