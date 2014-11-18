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

ActiveRecord::Schema.define(version: 20141014211454) do

  create_table "caterers", force: true do |t|
    t.string   "name"
    t.integer  "vendor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "florists", force: true do |t|
    t.string   "name"
    t.integer  "vendor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photographers", force: true do |t|
    t.string   "name"
    t.integer  "vendor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: true do |t|
    t.string   "service_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendor_types", force: true do |t|
    t.string   "vendor_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendors", force: true do |t|
    t.string   "vendor_type"
    t.integer  "vendor_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendor_dates", force: true do |t|
    t.integer  "vendor_id"
    t.date     "date"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venue_to_vendors", force: true do |t|
    t.integer  "venue_id"
    t.integer  "vendor_id"
    t.integer  "vendor_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", force: true do |t|
    t.string   "name"
    t.integer  "vendor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
