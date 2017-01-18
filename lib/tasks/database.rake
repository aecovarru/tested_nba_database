namespace :database do
  task :accuracy => :environment do
    require 'csv'
    season = Season.first
    CSV.open("tmp/accuracy.csv", "w") do |csv|
      season.games.each do |game|
        begin
          row = [game.id, game.url, game.accuracy]
          csv << row
        rescue NoMethodError => e
          puts "#{game.id} #{e.message}"
        end
      end
    end
  end

  task :connection => :environment do
    require 'open-uri'
    require 'nokogiri'
    url = "http://www.basketball-reference.com/boxscores/pbp/201510270ATL.html"
    puts url
    doc = Nokogiri::HTML(open(url, read_timeout: 10))
  end
end