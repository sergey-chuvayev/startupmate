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

ActiveRecord::Schema.define(version: 20160308121903) do

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "founder"
    t.string "city"
    t.string "country"
    t.string "postal_code"
    t.string "street"
    t.string "photo_link"
    t.string "latitude"
    t.string "longitude"
    t.text   "description"
  end

  create_table "places_tags", id: false, force: :cascade do |t|
    t.integer "place_id", null: false
    t.integer "tag_id",   null: false
  end

  add_index "places_tags", ["place_id", "tag_id"], name: "index_places_tags_on_place_id_and_tag_id"
  add_index "places_tags", ["tag_id", "place_id"], name: "index_places_tags_on_tag_id_and_place_id"

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

end
