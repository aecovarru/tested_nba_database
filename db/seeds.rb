# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

module Database
  (2016..2017).each do |year|
    SeasonBuilder.new.build(year)
    TeamBuilder.new.build(year)
    GameBuilder.new.build(year)
  end
end
