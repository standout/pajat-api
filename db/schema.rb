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

ActiveRecord::Schema.define(version: 20151219163534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "report_id"
    t.text     "content"
    t.string   "agent"
    t.string   "agent_ip"
    t.string   "commenter_network"
    t.string   "commenter_username"
    t.string   "old_status"
    t.string   "new_status"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "comments", ["report_id"], name: "index_comments_on_report_id", using: :btree

  create_table "reports", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.text     "description"
    t.string   "agent"
    t.string   "agent_ip"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "reporter_network"
    t.string   "reporter_username"
    t.string   "source_url"
    t.string   "image_url"
    t.integer  "status",            default: 0
  end

  add_foreign_key "comments", "reports"
end
