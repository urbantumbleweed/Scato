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

ActiveRecord::Schema.define(version: 20140403232645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "managers_users", force: true do |t|
    t.integer "user_id"
    t.integer "manager_id"
  end

  create_table "opportunities", force: true do |t|
    t.float   "strength"
    t.float   "risk"
    t.float   "expected_reward"
    t.float   "expected_reward_ratio"
    t.float   "aggregate_actual_opportunity_risk_reward_ratio"
    t.float   "aggregate_actual_opportunity_return"
    t.string  "opportunity_type"
    t.integer "priority"
    t.integer "ticker_id"
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

  create_table "patterns_tickers", id: false, force: true do |t|
    t.integer "pattern_id"
    t.integer "ticker_id"
  end

  create_table "patterns_users", id: false, force: true do |t|
    t.integer "pattern_id"
    t.integer "user_id"
  end

  create_table "price_histories", force: true do |t|
    t.integer "ticker_id"
    t.date    "date"
    t.float   "open"
    t.float   "high"
    t.float   "low"
    t.float   "close"
    t.float   "day_range"
    t.float   "open_close"
    t.float   "open_low"
    t.float   "open_high"
    t.float   "close_low"
    t.float   "close_high"
    t.boolean "priceUp"
    t.boolean "priceDown"
    t.integer "volume"
  end

  create_table "relevance", force: true do |t|
    t.integer "pattern_id"
    t.integer "scan_id"
    t.integer "pattern_relevance"
  end

  create_table "scans", force: true do |t|
    t.integer  "ticker_id"
    t.boolean  "entry_signal"
    t.boolean  "exit_signal"
    t.boolean  "entry_confirmation"
    t.boolean  "entry_confirmation_two"
    t.boolean  "exit_confirmation"
    t.boolean  "exit_confirmation_two"
    t.integer  "number_of_patterns"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickers", force: true do |t|
    t.string  "ticker"
    t.string  "name"
    t.string  "type"
    t.string  "exchange"
    t.string  "sector"
    t.string  "industry"
    t.date    "date"
    t.float   "ask"
    t.float   "bid"
    t.float   "previousClose"
    t.float   "open"
    t.float   "dayHigh"
    t.float   "dayLow"
    t.float   "lastTrade"
    t.float   "changePoints"
    t.float   "changePercent"
    t.float   "weeks52High"
    t.float   "weeks52Low"
    t.float   "peRatio"
    t.float   "pegRatio"
    t.float   "weeks52ChangeFromHigh"
    t.float   "weeks52ChangePercentFromHigh"
    t.float   "weeks52ChangeFromLow"
    t.float   "weeks52ChangePercentFromLow"
    t.integer "volume"
  end

  create_table "trades", force: true do |t|
    t.string   "entry_order_type"
    t.string   "exit_order_type"
    t.date     "entry_date"
    t.date     "exit_date"
    t.float    "entry_price"
    t.float    "exit_price"
    t.integer  "entry_quantity"
    t.integer  "exit_quantity"
    t.integer  "reference_ticker_id"
    t.integer  "user_id"
    t.integer  "opportunity_id"
    t.integer  "scan_id"
    t.integer  "ticker_id"
    t.integer  "usertunity_id"
    t.boolean  "trade_open"
    t.boolean  "profitable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.float    "balance"
    t.float    "max_position_percent"
    t.float    "max_risk_percent_per_position"
    t.boolean  "admin"
    t.boolean  "manager"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usertunities", force: true do |t|
    t.integer "user_id"
    t.integer "opportunity_id"
    t.integer "position_size"
    t.float   "risk_amount"
    t.float   "actual_usertunity_return"
    t.float   "actual_usertunity_risk_reward_ratio"
    t.float   "expected_usertunity_return"
    t.boolean "converted_to_trade"
  end

end
