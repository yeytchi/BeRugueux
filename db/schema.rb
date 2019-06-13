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

ActiveRecord::Schema.define(version: 2019_06_13_093524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "days", force: :cascade do |t|
    t.bigint "season_id"
    t.index ["season_id"], name: "index_days_on_season_id"
  end

  create_table "games", force: :cascade do |t|
    t.bigint "day_id"
    t.bigint "home_team_id"
    t.bigint "away_team_id"
    t.index ["away_team_id"], name: "index_games_on_away_team_id"
    t.index ["day_id"], name: "index_games_on_day_id"
    t.index ["home_team_id"], name: "index_games_on_home_team_id"
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "team_id"
    t.bigint "player_id"
    t.integer "amount", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_offers_on_player_id"
    t.index ["team_id"], name: "index_offers_on_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "club"
    t.integer "kicking_accuracy"
    t.boolean "kicker"
    t.string "position"
    t.boolean "injured", default: false
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players_positions", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "position_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_players_positions_on_player_id"
    t.index ["position_id"], name: "index_players_positions_on_position_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.integer "number_of_teams"
    t.integer "status", default: 0
    t.integer "round", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_seasons_on_user_id"
  end

  create_table "selections", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "team_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_selections_on_player_id"
    t.index ["team_id"], name: "index_selections_on_team_id"
  end

  create_table "statistics", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "game_id"
    t.integer "real_game_id"
    t.integer "rating"
    t.integer "minutes_played"
    t.integer "tries"
    t.integer "transformations"
    t.integer "kick_attempts"
    t.integer "successful_kicks"
    t.integer "conceded_penalties"
    t.index ["game_id"], name: "index_statistics_on_game_id"
    t.index ["player_id"], name: "index_statistics_on_player_id"
  end

  create_table "teams", force: :cascade do |t|
    t.bigint "season_id"
    t.bigint "user_id"
    t.string "name"
    t.string "logo"
    t.string "main_colour"
    t.string "secondary_colour"
    t.integer "status", default: 0
    t.integer "round", default: 1
    t.integer "budget", default: 1000
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_teams_on_season_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "days", "seasons"
  add_foreign_key "games", "days"
  add_foreign_key "offers", "players"
  add_foreign_key "offers", "teams"
  add_foreign_key "players_positions", "players"
  add_foreign_key "players_positions", "positions"
  add_foreign_key "seasons", "users"
  add_foreign_key "selections", "players"
  add_foreign_key "selections", "teams"
  add_foreign_key "statistics", "games"
  add_foreign_key "statistics", "players"
  add_foreign_key "teams", "seasons"
  add_foreign_key "teams", "users"
end
