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

ActiveRecord::Schema.define(version: 20140329225906) do

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

  create_table "investors_scans", id: false, force: true do |t|
    t.integer "investor_id"
    t.integer "scan_id"
  end

  create_table "opportunities", force: true do |t|
    t.integer "strength"
    t.float   "risk"
    t.float   "expected_reward"
    t.integer "priority"
    t.integer "scan_id"
  end

  create_table "scans", force: true do |t|
    t.string   "symbol"
    t.string   "security_type"
    t.datetime "created_at"
    t.datetime "updated_at"
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
