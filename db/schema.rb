# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161225101903) do

  create_table "game_dates", force: :cascade do |t|
    t.integer  "season_id"
    t.datetime "date"
    t.index ["season_id"], name: "index_game_dates_on_season_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "season_id"
    t.integer "game_date_id"
    t.integer "away_team_id"
    t.integer "home_team_id"
    t.index ["away_team_id"], name: "index_games_on_away_team_id"
    t.index ["game_date_id"], name: "index_games_on_game_date_id"
    t.index ["home_team_id"], name: "index_games_on_home_team_id"
    t.index ["season_id"], name: "index_games_on_season_id"
  end

  create_table "periods", force: :cascade do |t|
    t.integer "game_id"
    t.integer "quarter"
    t.index ["game_id"], name: "index_periods_on_game_id"
  end

  create_table "players", force: :cascade do |t|
    t.string  "intervalable_type"
    t.integer "intervalable_id"
    t.integer "team_id"
    t.string  "name"
    t.string  "abbr"
    t.string  "idstr"
    t.string  "position"
    t.boolean "starter"
    t.index ["abbr"], name: "index_players_on_abbr"
    t.index ["idstr"], name: "index_players_on_idstr"
    t.index ["intervalable_type", "intervalable_id"], name: "index_players_on_intervalable_type_and_intervalable_id"
    t.index ["name"], name: "index_players_on_name"
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "year"
  end

  create_table "stats", force: :cascade do |t|
    t.string  "statable_type"
    t.integer "statable_id"
    t.integer "sp",            default: 0
    t.integer "fgm",           default: 0
    t.integer "fga",           default: 0
    t.integer "thpa",          default: 0
    t.integer "thpm",          default: 0
    t.integer "fta",           default: 0
    t.integer "ftm",           default: 0
    t.integer "orb",           default: 0
    t.integer "drb",           default: 0
    t.integer "ast",           default: 0
    t.integer "stl",           default: 0
    t.integer "blk",           default: 0
    t.integer "tov",           default: 0
    t.integer "pf",            default: 0
    t.integer "pts",           default: 0
    t.float   "pace",          default: 0.0
    t.float   "ortg",          default: 0.0
    t.float   "drtg",          default: 0.0
    t.index ["statable_type", "statable_id"], name: "index_stats_on_statable_type_and_statable_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer "season_id"
    t.string  "name"
    t.string  "country"
    t.string  "abbr"
    t.string  "abbr2"
    t.index ["abbr"], name: "index_teams_on_abbr"
    t.index ["name"], name: "index_teams_on_name"
    t.index ["season_id"], name: "index_teams_on_season_id"
  end

end
