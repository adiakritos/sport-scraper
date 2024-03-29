# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160212091912) do

  create_table "games", force: :cascade do |t|
    t.string   "country"
    t.string   "tournament"
    t.string   "home_team"
    t.string   "away_team"
    t.integer  "home_score"
    t.integer  "away_score"
    t.integer  "timer"
    t.integer  "time"
    t.string   "sport"
    t.string   "source"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "games", ["source"], name: "index_games_on_source"
  add_index "games", ["sport"], name: "index_games_on_sport"
  add_index "games", ["state"], name: "index_games_on_state"
  add_index "games", ["tournament"], name: "index_games_on_tournament"

end
