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

ActiveRecord::Schema.define(version: 20160203160822) do

  create_table "battles", force: :cascade do |t|
    t.integer  "wizard_id"
    t.integer  "opponent_wizard_id"
    t.integer  "w_move"
    t.string   "o_move"
    t.integer  "status"
    t.integer  "winner"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "strategies", force: :cascade do |t|
    t.integer  "rock"
    t.integer  "paper"
    t.integer  "scissors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "wizards", force: :cascade do |t|
    t.string   "name"
    t.integer  "magic_type"
    t.integer  "level"
    t.integer  "lives"
    t.integer  "hp"
    t.integer  "attack"
    t.integer  "defense"
    t.integer  "exp"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "strategy_id"
  end

end
