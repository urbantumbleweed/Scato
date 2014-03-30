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

ActiveRecord::Schema.define(version: 20140330223753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "investors", force: true do |t|
    t.string "name"
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.float  "balance"
    t.float  "max_position_percent"
    t.float  "max_risk_percent_per_position"
  end

  create_table "investors_opportunities", id: false, force: true do |t|
    t.integer "investor_id"
    t.integer "opportunity_id"
  end

  create_table "opportunities", force: true do |t|
    t.integer "strength"
    t.float   "risk"
    t.float   "expected_reward"
    t.integer "priority"
    t.integer "scan_id"
  end

  create_table "patterns", force: true do |t|
    t.string  "name"
    t.string  "type"
    t.text    "description"
    t.float   "historical_target_reaching_strength"
    t.float   "historical_directional_reliability"
    t.integer "historical_rarity_ranking"
  end

  create_table "patterns_scans", force: true do |t|
    t.integer "pattern_id"
    t.integer "pattern_relevance"
    t.integer "scan_id"
  end

  create_table "patterns_symbols", force: true do |t|
    t.integer "pattern_id"
    t.integer "symbol_id"
  end

  create_table "price_histories", force: true do |t|
    t.date    "date"
    t.float   "open"
    t.float   "high"
    t.float   "low"
    t.float   "close"
    t.integer "volume"
  end

  create_table "scans", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "symbol_id"
    t.boolean  "entry_signal"
    t.boolean  "entry_confirmation"
    t.boolean  "entry_confirmation_two"
    t.boolean  "exit_signal"
    t.boolean  "exit_confirmation"
    t.boolean  "exit_confirmation_two"
  end

  create_table "symbols", force: true do |t|
    t.string  "symbol"
    t.string  "name"
    t.string  "exchange"
    t.date    "date"
    t.float   "ask"
    t.float   "bid"
    t.float   "volume"
    t.float   "previousClose"
    t.float   "open"
    t.float   "dayHigh"
    t.float   "dayLow"
    t.float   "lastTrade"
    t.float   "changePoints"
    t.float   "changePercent"
    t.float   "peRatio"
    t.float   "pegRatio"
    t.float   "weeks52High"
    t.float   "weeks52Low"
    t.float   "weeks52ChangeFromHigh"
    t.float   "weeks52ChangePercentFromHigh"
    t.float   "weeks52ChangeFromLow"
    t.float   "weeks52ChangePercentFromLow"
    t.integer "avgDailyVolume"
  end

  create_table "trades", force: true do |t|
    t.string  "primary_symbol"
    t.string  "reference_symbol"
    t.string  "entry_order_type"
    t.string  "exit_order_type"
    t.date    "entry_date"
    t.date    "exit_date"
    t.boolean "trade_open"
    t.float   "entry_price"
    t.integer "entry_quantity"
    t.float   "exit_price"
    t.integer "exit_quantity"
    t.integer "investor_id"
    t.integer "opportunity_id"
    t.float   "current_price"
  end

end
