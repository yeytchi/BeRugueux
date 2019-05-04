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

ActiveRecord::Schema.define(version: 2019_05_03_174706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drafts", force: :cascade do |t|
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "team_id"
    t.bigint "player_id"
    t.index ["player_id"], name: "index_drafts_on_player_id"
    t.index ["team_id"], name: "index_drafts_on_team_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "home_team"
    t.integer "away_team"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "team_id"
    t.index ["team_id"], name: "index_games_on_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "club"
    t.integer "kicking_accuracy"
    t.boolean "kicker"
    t.string "position"
    t.boolean "injured"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.string "name"
    t.integer "number_of_teams"
    t.string "calendar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_seasons_on_user_id"
  end

  create_table "statistics", force: :cascade do |t|
    t.integer "real_game_id"
    t.integer "rating"
    t.integer "minutes_played"
    t.integer "tries"
    t.integer "transformations"
    t.integer "kick_attempts"
    t.integer "successful_kicks"
    t.integer "conceded_penalties"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "game_id"
    t.bigint "player_id"
    t.index ["game_id"], name: "index_statistics_on_game_id"
    t.index ["player_id"], name: "index_statistics_on_player_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.string "main_colour"
    t.string "secondary_colour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "season_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "drafts", "players"
  add_foreign_key "drafts", "teams"
  add_foreign_key "games", "teams"
  add_foreign_key "seasons", "users"
  add_foreign_key "statistics", "games"
  add_foreign_key "statistics", "players"
  add_foreign_key "teams", "seasons"
  add_foreign_key "teams", "users"
end
